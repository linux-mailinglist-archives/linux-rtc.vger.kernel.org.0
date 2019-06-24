Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94256507C2
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2019 12:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730604AbfFXKJr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Jun 2019 06:09:47 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40281 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730471AbfFXKIh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 Jun 2019 06:08:37 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E81F860008;
        Mon, 24 Jun 2019 10:08:29 +0000 (UTC)
Date:   Mon, 24 Jun 2019 12:08:28 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexander Aring <alex.aring@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wpan@vger.kernel.org,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>
Subject: Re: [PATCH v2 12/28] drivers: Introduce class_find_device_by_name()
 helper
Message-ID: <20190624100828.GD3133@piout.net>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-13-git-send-email-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560534863-15115-13-git-send-email-suzuki.poulose@arm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/06/2019 18:54:07+0100, Suzuki K Poulose wrote:
> Add a new wrapper for class_find_device() to search for devices
> by name and convert the existing users to use the new helper.
> 
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexander Aring <alex.aring@gmail.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux-wpan@vger.kernel.org
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Stefan Schmidt <stefan@datenfreihafen.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/hwtracing/stm/core.c     |  9 +--------
>  drivers/leds/led-class.c         |  9 +--------
>  drivers/rtc/interface.c          | 11 +----------
>  drivers/s390/crypto/zcrypt_api.c | 11 +----------
>  drivers/usb/roles/class.c        |  8 +-------
>  drivers/usb/typec/class.c        |  8 +-------
>  include/linux/device.h           | 12 ++++++++++++
>  net/ieee802154/core.c            |  7 +------
>  8 files changed, 19 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index e55b902..2b6bd42 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -89,13 +89,6 @@ static struct class stm_class = {
>  	.dev_groups	= stm_groups,
>  };
>  
> -static int stm_dev_match(struct device *dev, const void *data)
> -{
> -	const char *name = data;
> -
> -	return sysfs_streq(name, dev_name(dev));
> -}
> -
>  /**
>   * stm_find_device() - find stm device by name
>   * @buf:	character buffer containing the name
> @@ -116,7 +109,7 @@ struct stm_device *stm_find_device(const char *buf)
>  	if (!stm_core_up)
>  		return NULL;
>  
> -	dev = class_find_device(&stm_class, NULL, buf, stm_dev_match);
> +	dev = class_find_device_by_name(&stm_class, buf);
>  	if (!dev)
>  		return NULL;
>  
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 85848c5..317a619 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -216,13 +216,6 @@ static int led_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
>  
> -static int match_name(struct device *dev, const void *data)
> -{
> -	if (!dev_name(dev))
> -		return 0;
> -	return !strcmp(dev_name(dev), (char *)data);
> -}
> -
>  static int led_classdev_next_name(const char *init_name, char *name,
>  				  size_t len)
>  {
> @@ -233,7 +226,7 @@ static int led_classdev_next_name(const char *init_name, char *name,
>  	strlcpy(name, init_name, len);
>  
>  	while ((ret < len) &&
> -	       (dev = class_find_device(leds_class, NULL, name, match_name))) {
> +	       (dev = class_find_device_by_name(leds_class, name))) {
>  		put_device(dev);
>  		ret = snprintf(name, len, "%s_%u", init_name, ++i);
>  	}
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 4124f4d..1bee39c 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -663,21 +663,12 @@ void rtc_update_irq(struct rtc_device *rtc,
>  }
>  EXPORT_SYMBOL_GPL(rtc_update_irq);
>  
> -static int __rtc_match(struct device *dev, const void *data)
> -{
> -	const char *name = data;
> -
> -	if (strcmp(dev_name(dev), name) == 0)
> -		return 1;
> -	return 0;
> -}
> -
>  struct rtc_device *rtc_class_open(const char *name)
>  {
>  	struct device *dev;
>  	struct rtc_device *rtc = NULL;
>  
> -	dev = class_find_device(rtc_class, NULL, name, __rtc_match);
> +	dev = class_find_device_by_name(rtc_class, name);
>  	if (dev)
>  		rtc = to_rtc_device(dev);
>  
> diff --git a/drivers/s390/crypto/zcrypt_api.c b/drivers/s390/crypto/zcrypt_api.c
> index 1058b4b..38a5a47 100644
> --- a/drivers/s390/crypto/zcrypt_api.c
> +++ b/drivers/s390/crypto/zcrypt_api.c
> @@ -133,12 +133,6 @@ struct zcdn_device {
>  static int zcdn_create(const char *name);
>  static int zcdn_destroy(const char *name);
>  
> -/* helper function, matches the name for find_zcdndev_by_name() */
> -static int __match_zcdn_name(struct device *dev, const void *data)
> -{
> -	return strcmp(dev_name(dev), (const char *)data) == 0;
> -}
> -
>  /* helper function, matches the devt value for find_zcdndev_by_devt() */
>  static int __match_zcdn_devt(struct device *dev, const void *data)
>  {
> @@ -152,10 +146,7 @@ static int __match_zcdn_devt(struct device *dev, const void *data)
>   */
>  static inline struct zcdn_device *find_zcdndev_by_name(const char *name)
>  {
> -	struct device *dev =
> -		class_find_device(zcrypt_class, NULL,
> -				  (void *) name,
> -				  __match_zcdn_name);
> +	struct device *dev = class_find_device_by_name(zcrypt_class, name);
>  
>  	return dev ? to_zcdn_dev(dev) : NULL;
>  }
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index f45d8df..07aaa96 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -90,11 +90,6 @@ static int switch_fwnode_match(struct device *dev, const void *fwnode)
>  	return dev_fwnode(dev) == fwnode;
>  }
>  
> -static int switch_name_match(struct device *dev, const void *name)
> -{
> -	return !strcmp((const char *)name, dev_name(dev));
> -}
> -
>  static void *usb_role_switch_match(struct device_connection *con, int ep,
>  				   void *data)
>  {
> @@ -107,8 +102,7 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
>  		dev = class_find_device(role_class, NULL, con->fwnode,
>  					switch_fwnode_match);
>  	} else {
> -		dev = class_find_device(role_class, NULL, con->endpoint[ep],
> -					switch_name_match);
> +		dev = class_find_device_by_name(role_class, con->endpoint[ep]);
>  	}
>  
>  	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 2eb6238..18a0687 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -210,11 +210,6 @@ static int typec_port_fwnode_match(struct device *dev, const void *fwnode)
>  	return dev_fwnode(dev) == fwnode;
>  }
>  
> -static int typec_port_name_match(struct device *dev, const void *name)
> -{
> -	return !strcmp((const char *)name, dev_name(dev));
> -}
> -
>  static void *typec_port_match(struct device_connection *con, int ep, void *data)
>  {
>  	struct device *dev;
> @@ -227,8 +222,7 @@ static void *typec_port_match(struct device_connection *con, int ep, void *data)
>  		return class_find_device(typec_class, NULL, con->fwnode,
>  					 typec_port_fwnode_match);
>  
> -	dev = class_find_device(typec_class, NULL, con->endpoint[ep],
> -				typec_port_name_match);
> +	dev = class_find_device_by_name(typec_class, con->endpoint[ep]);
>  
>  	return dev ? dev : ERR_PTR(-EPROBE_DEFER);
>  }
> diff --git a/include/linux/device.h b/include/linux/device.h
> index a449d09..bb14c7f 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -485,6 +485,18 @@ extern struct device *class_find_device(struct class *class,
>  					struct device *start, const void *data,
>  					int (*match)(struct device *, const void *));
>  
> +/**
> + * class_find_device_by_name - device iterator for locating a particular device
> + * of a specific name.
> + * @class: class type
> + * @name: name of the device to match
> + */
> +static inline struct device *class_find_device_by_name(struct class *class,
> +						       const char *name)
> +{
> +	return class_find_device(class, NULL, name, device_match_name);
> +}
> +
>  struct class_attribute {
>  	struct attribute attr;
>  	ssize_t (*show)(struct class *class, struct class_attribute *attr,
> diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
> index 60b7ac5..de259b5 100644
> --- a/net/ieee802154/core.c
> +++ b/net/ieee802154/core.c
> @@ -23,11 +23,6 @@
>  LIST_HEAD(cfg802154_rdev_list);
>  int cfg802154_rdev_list_generation;
>  
> -static int wpan_phy_match(struct device *dev, const void *data)
> -{
> -	return !strcmp(dev_name(dev), (const char *)data);
> -}
> -
>  struct wpan_phy *wpan_phy_find(const char *str)
>  {
>  	struct device *dev;
> @@ -35,7 +30,7 @@ struct wpan_phy *wpan_phy_find(const char *str)
>  	if (WARN_ON(!str))
>  		return NULL;
>  
> -	dev = class_find_device(&wpan_phy_class, NULL, str, wpan_phy_match);
> +	dev = class_find_device_by_name(&wpan_phy_class, str);
>  	if (!dev)
>  		return NULL;
>  
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
