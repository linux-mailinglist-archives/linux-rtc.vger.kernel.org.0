Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC394668A
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2019 19:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfFNRzH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Jun 2019 13:55:07 -0400
Received: from foss.arm.com ([217.140.110.172]:39448 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfFNRzH (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 14 Jun 2019 13:55:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3123E346;
        Fri, 14 Jun 2019 10:55:06 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 302813F718;
        Fri, 14 Jun 2019 10:55:03 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexander Aring <alex.aring@gmail.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, Dan Murphy <dmurphy@ti.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wpan@vger.kernel.org,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v2 10/28] drivers: Add generic helper to match by name
Date:   Fri, 14 Jun 2019 18:54:05 +0100
Message-Id: <1560534863-15115-11-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add a helper to match the device name. Also reuse this generic
exported helper for bus_find_device_by_name(). This will also be
used to add similar interface for (driver/class)_find_device()

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexander Aring <alex.aring@gmail.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Harald Freudenberger <freude@linux.ibm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-leds@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-wpan@vger.kernel.org
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/base/bus.c     | 24 ------------------------
 drivers/base/core.c    |  6 ++++++
 include/linux/device.h | 18 +++++++++++++++---
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index df3cac7..a1d1e82 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -342,30 +342,6 @@ struct device *bus_find_device(struct bus_type *bus,
 }
 EXPORT_SYMBOL_GPL(bus_find_device);
 
-static int match_name(struct device *dev, const void *data)
-{
-	const char *name = data;
-
-	return sysfs_streq(name, dev_name(dev));
-}
-
-/**
- * bus_find_device_by_name - device iterator for locating a particular device of a specific name
- * @bus: bus type
- * @start: Device to begin with
- * @name: name of the device to match
- *
- * This is similar to the bus_find_device() function above, but it handles
- * searching by a name automatically, no need to write another strcmp matching
- * function.
- */
-struct device *bus_find_device_by_name(struct bus_type *bus,
-				       struct device *start, const char *name)
-{
-	return bus_find_device(bus, start, (void *)name, match_name);
-}
-EXPORT_SYMBOL_GPL(bus_find_device_by_name);
-
 /**
  * subsys_find_device_by_id - find a device with a specific enumeration number
  * @subsys: subsystem
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 597095b..5724f93 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3352,3 +3352,9 @@ int device_match_acpi_dev(struct device *dev, const void *adev)
 	return ACPI_COMPANION(dev) == adev;
 }
 EXPORT_SYMBOL(device_match_acpi_dev);
+
+int device_match_name(struct device *dev, const void *name)
+{
+	return sysfs_streq(dev_name(dev), name);
+}
+EXPORT_SYMBOL_GPL(device_match_name);
diff --git a/include/linux/device.h b/include/linux/device.h
index a03b50d..b9b82b7 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -167,15 +167,27 @@ int device_match_of_node(struct device *dev, const void *np);
 int device_match_fwnode(struct device *dev, const void *fwnode);
 int device_match_devt(struct device *dev, const void *pdevt);
 int device_match_acpi_dev(struct device *dev, const void *adev);
+int device_match_name(struct device *dev, const void *name);
 
 int bus_for_each_dev(struct bus_type *bus, struct device *start, void *data,
 		     int (*fn)(struct device *dev, void *data));
 struct device *bus_find_device(struct bus_type *bus, struct device *start,
 			       const void *data,
 			       int (*match)(struct device *dev, const void *data));
-struct device *bus_find_device_by_name(struct bus_type *bus,
-				       struct device *start,
-				       const char *name);
+/**
+ * bus_find_device_by_name - device iterator for locating a particular device
+ * of a specific name.
+ * @bus: bus type
+ * @start: Device to begin with
+ * @name: name of the device to match
+ */
+static inline struct device *bus_find_device_by_name(struct bus_type *bus,
+						     struct device *start,
+						     const char *name)
+{
+	return bus_find_device(bus, start, name, device_match_name);
+}
+
 struct device *subsys_find_device_by_id(struct bus_type *bus, unsigned int id,
 					struct device *hint);
 int bus_for_each_drv(struct bus_type *bus, struct device_driver *start,
-- 
2.7.4

