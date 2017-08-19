'''
WangQL
2017/8/8
'''
import cifar10, cifar10_input
import tensorflow as tf
import numpy as np
import time

max_steps = 3000
batch_size = 128
data_dir = 'C:\\Users\\WangQL\\Desktop\\tmp\\cifar10_data\\cifar-10-batches-bin'

#define weights
def variable_with_weight_loss(shape, stddev, wl):
    var = tf.Variable(tf.truncated_normal(shape, stddev = stddev))
    if wl is not None:
        weight_loss = tf.multiply(tf.nn.l2_loss(var), wl, name = 'weight_loss')
        tf.add_collection('losses', weight_loss)
    return var

#data
#cifar10.maybe_download_and_extract()

images_train, labels_train = cifar10_input.distorted_inputs(
    data_dir = data_dir, batch_size = batch_size)

image_test, labels_test = cifar10_input.inputs(eval_data = True, data_dir = data_dir, batch_size = batch_size)

#holder
image_holder = tf.placeholder(tf.float32, [batch_size, 24, 24, 3])
label_holder = tf.placeholder(tf.int32, [batch_size])