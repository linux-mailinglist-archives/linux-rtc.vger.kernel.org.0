Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF3436012
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2019 17:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbfFEPOx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Jun 2019 11:14:53 -0400
Received: from foss.arm.com ([217.140.101.70]:33540 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728582AbfFEPOw (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 5 Jun 2019 11:14:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71BF615A2;
        Wed,  5 Jun 2019 08:14:52 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91E053F246;
        Wed,  5 Jun 2019 08:14:47 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexander Aring <alex.aring@gmail.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
        Dan Murphy <dmurphy@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jiri Slaby <jslaby@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wpan@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Peter Rosin <peda@axentia.se>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH 10/13] drivers: Introduce variants of class_find_device()
Date:   Wed,  5 Jun 2019 16:13:47 +0100
Message-Id: <1559747630-28065-11-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559747630-28065-1-git-send-email-suzuki.poulose@arm.com>
References: <1559747630-28065-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Now that we have generic helpers to match various generic
device attributes, provide wrappers to the class_find_device()
to lookup devices by individual properties. The new wrappers
except the lookup by devt, drops the "start" device pointer as
none of the existing users need it and the attributes are usually
unique. The idea is to stop the proliferation of custom match
functions to do generic attribute matching.

So now we have :

    class_find_device_by_name
    class_find_device_by_of_node
    class_find_device_by_fwnode
    class_find_device_by_devt

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexander Aring <alex.aring@gmail.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-leds@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-wpan@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Rosin <peda@axentia.se>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 include/linux/device.h | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 8c8727b..4396edc 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -474,6 +474,57 @@ extern struct device *class_find_device(struct class *class,
 					struct device *start, const void *data,
 					int (*match)(struct device *, const void *));
 
+/**
+ * class_find_device_by_name - device iterator for locating a particular device
+ * of a specific name.
+ * @class: class type
+ * @name: name of the device to match
+ */
+static inline struct device *class_find_device_by_name(struct class *class,
+						       const char *name)
+{
+	return class_find_device(class, NULL, name, device_match_name);
+}
+
+/**
+ * class_find_device_by_of_node : device iterator for locating a particular device
+ * matching the of_node.
+ * @class: class type
+ * @np: of_node of the device to match.
+ */
+static inline struct device *
+class_find_device_by_of_node(struct class *class, const struct device_node *np)
+{
+	return class_find_device(class, NULL, np, device_match_of_node);
+}
+
+/**
+ * class_find_device_by_fwnode : device iterator for locating a particular device
+ * matching the fwnode.
+ * @class: class type
+ * @fwnode: fwnode of the device to match.
+ */
+static inline struct device *
+class_find_device_by_fwnode(struct class *class,
+			    const struct fwnode_handle *fwnode)
+{
+	return class_find_device(class, NULL, fwnode, device_match_fwnode);
+}
+
+/**
+ * class_find_device_by_devt : device iterator for locating a particular device
+ * matching the device type.
+ * @class: class type
+ * @start: device to start search from
+ * @devt: device type of the device to match.
+ */
+static inline struct device *class_find_device_by_devt(struct class *class,
+						       struct device *start,
+						       dev_t devt)
+{
+	return class_find_device(class, start, &devt, device_match_devt);
+}
+
 struct class_attribute {
 	struct attribute attr;
 	ssize_t (*show)(struct class *class, struct class_attribute *attr,
-- 
2.7.4

