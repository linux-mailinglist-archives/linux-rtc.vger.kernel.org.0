Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8532B70F8
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 22:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgKQVfO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 16:35:14 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45013 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgKQVfO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 16:35:14 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 479701BF205;
        Tue, 17 Nov 2020 21:35:05 +0000 (UTC)
Date:   Tue, 17 Nov 2020 22:35:04 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 7/8] rtc: rework rtc_register_device() resource management
Message-ID: <20201117213504.GY4556@piout.net>
References: <20201109163409.24301-1-brgl@bgdev.pl>
 <20201109163409.24301-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109163409.24301-8-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/11/2020 17:34:08+0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> rtc_register_device() is a managed interface but it doesn't use devres
> by itself - instead it marks an rtc_device as "registered" and the devres
> callback for devm_rtc_allocate_device() takes care of resource release.
> 
> This doesn't correspond with the design behind devres where managed
> structures should not be aware of being managed. The correct solution
> here is to register a separate devres callback for unregistering the
> device.
> 
> While at it: rename rtc_register_device() to devm_rtc_register_device()
> and add it to the list of managed interfaces in devres.rst. This way we
> can avoid any potential confusion of driver developers who may expect
> there to exist a corresponding unregister function.
> 

I'm going to apply that but honestly, I don't like the fact that we now
end up with both devm_rtc_device_register and devm_rtc_register_device.
This was the main reason to not have the devm_ prefix there. I find that
way more confusing than the current situation.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../driver-api/driver-model/devres.rst        |  1 +
>  arch/alpha/kernel/rtc.c                       |  2 +-
>  drivers/mfd/menelaus.c                        |  2 +-
>  drivers/rtc/class.c                           | 19 +++++++++----------
>  drivers/rtc/rtc-88pm80x.c                     |  2 +-
>  drivers/rtc/rtc-88pm860x.c                    |  2 +-
>  drivers/rtc/rtc-ab-b5ze-s3.c                  |  2 +-
>  drivers/rtc/rtc-ab-eoz9.c                     |  2 +-
>  drivers/rtc/rtc-ab3100.c                      |  2 +-
>  drivers/rtc/rtc-ab8500.c                      |  2 +-
>  drivers/rtc/rtc-abx80x.c                      |  2 +-
>  drivers/rtc/rtc-ac100.c                       |  2 +-
>  drivers/rtc/rtc-armada38x.c                   |  2 +-
>  drivers/rtc/rtc-aspeed.c                      |  2 +-
>  drivers/rtc/rtc-at91rm9200.c                  |  2 +-
>  drivers/rtc/rtc-at91sam9.c                    |  2 +-
>  drivers/rtc/rtc-au1xxx.c                      |  2 +-
>  drivers/rtc/rtc-bd70528.c                     |  2 +-
>  drivers/rtc/rtc-brcmstb-waketimer.c           |  2 +-
>  drivers/rtc/rtc-cadence.c                     |  2 +-
>  drivers/rtc/rtc-cmos.c                        |  2 +-
>  drivers/rtc/rtc-coh901331.c                   |  2 +-
>  drivers/rtc/rtc-cpcap.c                       |  2 +-
>  drivers/rtc/rtc-cros-ec.c                     |  2 +-
>  drivers/rtc/rtc-da9052.c                      |  2 +-
>  drivers/rtc/rtc-da9063.c                      |  2 +-
>  drivers/rtc/rtc-davinci.c                     |  2 +-
>  drivers/rtc/rtc-digicolor.c                   |  2 +-
>  drivers/rtc/rtc-dm355evm.c                    |  2 +-
>  drivers/rtc/rtc-ds1305.c                      |  2 +-
>  drivers/rtc/rtc-ds1307.c                      |  2 +-
>  drivers/rtc/rtc-ds1343.c                      |  2 +-
>  drivers/rtc/rtc-ds1347.c                      |  2 +-
>  drivers/rtc/rtc-ds1374.c                      |  2 +-
>  drivers/rtc/rtc-ds1511.c                      |  2 +-
>  drivers/rtc/rtc-ds1553.c                      |  2 +-
>  drivers/rtc/rtc-ds1672.c                      |  2 +-
>  drivers/rtc/rtc-ds1685.c                      |  2 +-
>  drivers/rtc/rtc-ds1742.c                      |  2 +-
>  drivers/rtc/rtc-ds2404.c                      |  2 +-
>  drivers/rtc/rtc-ep93xx.c                      |  2 +-
>  drivers/rtc/rtc-fsl-ftm-alarm.c               |  2 +-
>  drivers/rtc/rtc-ftrtc010.c                    |  2 +-
>  drivers/rtc/rtc-goldfish.c                    |  2 +-
>  drivers/rtc/rtc-imx-sc.c                      |  2 +-
>  drivers/rtc/rtc-imxdi.c                       |  2 +-
>  drivers/rtc/rtc-isl12026.c                    |  2 +-
>  drivers/rtc/rtc-isl1208.c                     |  2 +-
>  drivers/rtc/rtc-jz4740.c                      |  2 +-
>  drivers/rtc/rtc-lpc32xx.c                     |  2 +-
>  drivers/rtc/rtc-ls1x.c                        |  2 +-
>  drivers/rtc/rtc-m41t80.c                      |  2 +-
>  drivers/rtc/rtc-m48t59.c                      |  2 +-
>  drivers/rtc/rtc-m48t86.c                      |  2 +-
>  drivers/rtc/rtc-mc13xxx.c                     |  2 +-
>  drivers/rtc/rtc-meson-vrtc.c                  |  2 +-
>  drivers/rtc/rtc-meson.c                       |  2 +-
>  drivers/rtc/rtc-mpc5121.c                     |  2 +-
>  drivers/rtc/rtc-mrst.c                        |  2 +-
>  drivers/rtc/rtc-mt2712.c                      |  2 +-
>  drivers/rtc/rtc-mt6397.c                      |  2 +-
>  drivers/rtc/rtc-mv.c                          |  2 +-
>  drivers/rtc/rtc-mxc.c                         |  2 +-
>  drivers/rtc/rtc-mxc_v2.c                      |  2 +-
>  drivers/rtc/rtc-omap.c                        |  2 +-
>  drivers/rtc/rtc-pcap.c                        |  2 +-
>  drivers/rtc/rtc-pcf2123.c                     |  2 +-
>  drivers/rtc/rtc-pcf2127.c                     |  2 +-
>  drivers/rtc/rtc-pcf85063.c                    |  2 +-
>  drivers/rtc/rtc-pcf85363.c                    |  2 +-
>  drivers/rtc/rtc-pcf8563.c                     |  2 +-
>  drivers/rtc/rtc-pic32.c                       |  2 +-
>  drivers/rtc/rtc-pl030.c                       |  2 +-
>  drivers/rtc/rtc-pl031.c                       |  2 +-
>  drivers/rtc/rtc-pm8xxx.c                      |  2 +-
>  drivers/rtc/rtc-ps3.c                         |  2 +-
>  drivers/rtc/rtc-r9701.c                       |  2 +-
>  drivers/rtc/rtc-rc5t619.c                     |  2 +-
>  drivers/rtc/rtc-rk808.c                       |  2 +-
>  drivers/rtc/rtc-rp5c01.c                      |  2 +-
>  drivers/rtc/rtc-rs5c348.c                     |  2 +-
>  drivers/rtc/rtc-rv3028.c                      |  2 +-
>  drivers/rtc/rtc-rv3029c2.c                    |  2 +-
>  drivers/rtc/rtc-rv3032.c                      |  2 +-
>  drivers/rtc/rtc-rv8803.c                      |  2 +-
>  drivers/rtc/rtc-rx8010.c                      |  2 +-
>  drivers/rtc/rtc-rx8581.c                      |  2 +-
>  drivers/rtc/rtc-s35390a.c                     |  2 +-
>  drivers/rtc/rtc-sa1100.c                      |  2 +-
>  drivers/rtc/rtc-sc27xx.c                      |  2 +-
>  drivers/rtc/rtc-sd3078.c                      |  2 +-
>  drivers/rtc/rtc-sh.c                          |  2 +-
>  drivers/rtc/rtc-sirfsoc.c                     |  2 +-
>  drivers/rtc/rtc-snvs.c                        |  2 +-
>  drivers/rtc/rtc-st-lpc.c                      |  2 +-
>  drivers/rtc/rtc-starfire.c                    |  2 +-
>  drivers/rtc/rtc-stk17ta8.c                    |  2 +-
>  drivers/rtc/rtc-stmp3xxx.c                    |  2 +-
>  drivers/rtc/rtc-sun4v.c                       |  2 +-
>  drivers/rtc/rtc-sun6i.c                       |  2 +-
>  drivers/rtc/rtc-sunxi.c                       |  2 +-
>  drivers/rtc/rtc-tegra.c                       |  2 +-
>  drivers/rtc/rtc-test.c                        |  2 +-
>  drivers/rtc/rtc-tps6586x.c                    |  2 +-
>  drivers/rtc/rtc-tps65910.c                    |  2 +-
>  drivers/rtc/rtc-tx4939.c                      |  2 +-
>  drivers/rtc/rtc-vr41xx.c                      |  2 +-
>  drivers/rtc/rtc-vt8500.c                      |  2 +-
>  drivers/rtc/rtc-wilco-ec.c                    |  2 +-
>  drivers/rtc/rtc-wm831x.c                      |  2 +-
>  drivers/rtc/rtc-xgene.c                       |  2 +-
>  drivers/rtc/rtc-zynqmp.c                      |  2 +-
>  drivers/rtc/sysfs.c                           |  2 --
>  include/linux/rtc.h                           |  8 +++-----
>  114 files changed, 123 insertions(+), 127 deletions(-)
> 
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
> index 5df7ba54a4ba..cd8b6e657b94 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -414,6 +414,7 @@ RESET
>  RTC
>    devm_rtc_device_register()
>    devm_rtc_allocate_device()
> +  devm_rtc_register_device()
>    devm_rtc_nvmem_register()
>  
>  SERDEV
> diff --git a/arch/alpha/kernel/rtc.c b/arch/alpha/kernel/rtc.c
> index 1b1d5963ac55..ce3077946e1d 100644
> --- a/arch/alpha/kernel/rtc.c
> +++ b/arch/alpha/kernel/rtc.c
> @@ -216,6 +216,6 @@ alpha_rtc_init(void)
>  		rtc->ops = &remote_rtc_ops;
>  #endif
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  device_initcall(alpha_rtc_init);
> diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
> index b64d3315a5e1..07e0ca2e467c 100644
> --- a/drivers/mfd/menelaus.c
> +++ b/drivers/mfd/menelaus.c
> @@ -1119,7 +1119,7 @@ static inline void menelaus_rtc_init(struct menelaus_chip *m)
>  		menelaus_write_reg(MENELAUS_RTC_CTRL, m->rtc_control);
>  	}
>  
> -	err = rtc_register_device(m->rtc);
> +	err = devm_rtc_register_device(m->rtc);
>  	if (err) {
>  		if (alarm) {
>  			menelaus_remove_irq_work(MENELAUS_RTCALM_IRQ);
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index a99b7d24b77c..b8a34ee039ad 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -321,8 +321,10 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
>   *
>   * @rtc: the RTC class device to destroy
>   */
> -static void rtc_device_unregister(struct rtc_device *rtc)
> +static void devm_rtc_unregister_device(void *data)
>  {
> +	struct rtc_device *rtc = data;
> +
>  	mutex_lock(&rtc->ops_lock);
>  	/*
>  	 * Remove innards of this RTC, then disable it, before
> @@ -339,10 +341,7 @@ static void devm_rtc_release_device(struct device *dev, void *res)
>  {
>  	struct rtc_device *rtc = *(struct rtc_device **)res;
>  
> -	if (rtc->registered)
> -		rtc_device_unregister(rtc);
> -	else
> -		put_device(&rtc->dev);
> +	put_device(&rtc->dev);
>  }
>  
>  struct rtc_device *devm_rtc_allocate_device(struct device *dev)
> @@ -383,7 +382,7 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_rtc_allocate_device);
>  
> -int __rtc_register_device(struct module *owner, struct rtc_device *rtc)
> +int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
>  {
>  	struct rtc_wkalrm alrm;
>  	int err;
> @@ -413,7 +412,6 @@ int __rtc_register_device(struct module *owner, struct rtc_device *rtc)
>  
>  	rtc_proc_add_device(rtc);
>  
> -	rtc->registered = true;
>  	dev_info(rtc->dev.parent, "registered as %s\n",
>  		 dev_name(&rtc->dev));
>  
> @@ -422,9 +420,10 @@ int __rtc_register_device(struct module *owner, struct rtc_device *rtc)
>  		rtc_hctosys(rtc);
>  #endif
>  
> -	return 0;
> +	return devm_add_action_or_reset(rtc->dev.parent,
> +					devm_rtc_unregister_device, rtc);
>  }
> -EXPORT_SYMBOL_GPL(__rtc_register_device);
> +EXPORT_SYMBOL_GPL(__devm_rtc_register_device);
>  
>  /**
>   * devm_rtc_device_register - resource managed rtc_device_register()
> @@ -454,7 +453,7 @@ struct rtc_device *devm_rtc_device_register(struct device *dev,
>  
>  	rtc->ops = ops;
>  
> -	err = __rtc_register_device(owner, rtc);
> +	err = __devm_rtc_register_device(owner, rtc);
>  	if (err)
>  		return ERR_PTR(err);
>  
> diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
> index 75779e8501a3..6a3f44cf6ebe 100644
> --- a/drivers/rtc/rtc-88pm80x.c
> +++ b/drivers/rtc/rtc-88pm80x.c
> @@ -294,7 +294,7 @@ static int pm80x_rtc_probe(struct platform_device *pdev)
>  	info->rtc_dev->ops = &pm80x_rtc_ops;
>  	info->rtc_dev->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(info->rtc_dev);
> +	ret = devm_rtc_register_device(info->rtc_dev);
>  	if (ret)
>  		goto out_rtc;
>  
> diff --git a/drivers/rtc/rtc-88pm860x.c b/drivers/rtc/rtc-88pm860x.c
> index c90457d001e9..2c809a1a445e 100644
> --- a/drivers/rtc/rtc-88pm860x.c
> +++ b/drivers/rtc/rtc-88pm860x.c
> @@ -307,7 +307,7 @@ static int pm860x_rtc_probe(struct platform_device *pdev)
>  	info->rtc_dev->ops = &pm860x_rtc_ops;
>  	info->rtc_dev->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(info->rtc_dev);
> +	ret = devm_rtc_register_device(info->rtc_dev);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
> index 2370ac0cdb5f..6e3e320dc727 100644
> --- a/drivers/rtc/rtc-ab-b5ze-s3.c
> +++ b/drivers/rtc/rtc-ab-b5ze-s3.c
> @@ -892,7 +892,7 @@ static int abb5zes3_probe(struct i2c_client *client,
>  		}
>  	}
>  
> -	ret = rtc_register_device(data->rtc);
> +	ret = devm_rtc_register_device(data->rtc);
>  
>  err:
>  	if (ret && data->irq)
> diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> index d690985caa4c..b20d8f26dcdb 100644
> --- a/drivers/rtc/rtc-ab-eoz9.c
> +++ b/drivers/rtc/rtc-ab-eoz9.c
> @@ -420,7 +420,7 @@ static int abeoz9_probe(struct i2c_client *client,
>  	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	ret = rtc_register_device(data->rtc);
> +	ret = devm_rtc_register_device(data->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-ab3100.c b/drivers/rtc/rtc-ab3100.c
> index 2ed6def90975..e4fd961e8bf6 100644
> --- a/drivers/rtc/rtc-ab3100.c
> +++ b/drivers/rtc/rtc-ab3100.c
> @@ -238,7 +238,7 @@ static int __init ab3100_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rtc);
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct platform_driver ab3100_rtc_driver = {
> diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
> index 3d60f3283f11..b40048871295 100644
> --- a/drivers/rtc/rtc-ab8500.c
> +++ b/drivers/rtc/rtc-ab8500.c
> @@ -404,7 +404,7 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static int ab8500_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> index 803725b3a02c..6733bb0df674 100644
> --- a/drivers/rtc/rtc-abx80x.c
> +++ b/drivers/rtc/rtc-abx80x.c
> @@ -851,7 +851,7 @@ static int abx80x_probe(struct i2c_client *client,
>  		return err;
>  	}
>  
> -	return rtc_register_device(priv->rtc);
> +	return devm_rtc_register_device(priv->rtc);
>  }
>  
>  static const struct i2c_device_id abx80x_id[] = {
> diff --git a/drivers/rtc/rtc-ac100.c b/drivers/rtc/rtc-ac100.c
> index 29223931aba7..1ddbef99e38f 100644
> --- a/drivers/rtc/rtc-ac100.c
> +++ b/drivers/rtc/rtc-ac100.c
> @@ -610,7 +610,7 @@ static int ac100_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return rtc_register_device(chip->rtc);
> +	return devm_rtc_register_device(chip->rtc);
>  }
>  
>  static int ac100_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> index 94d7c22fc4f3..807a79c07f08 100644
> --- a/drivers/rtc/rtc-armada38x.c
> +++ b/drivers/rtc/rtc-armada38x.c
> @@ -556,7 +556,7 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
>  
>  	rtc->rtc_dev->range_max = U32_MAX;
>  
> -	return rtc_register_device(rtc->rtc_dev);
> +	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
> index eacdd0637cce..a93352ed3aec 100644
> --- a/drivers/rtc/rtc-aspeed.c
> +++ b/drivers/rtc/rtc-aspeed.c
> @@ -104,7 +104,7 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>  	rtc->rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
>  
> -	return rtc_register_device(rtc->rtc_dev);
> +	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
>  static const struct of_device_id aspeed_rtc_match[] = {
> diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
> index 5e811e04cb21..ba49cc095aef 100644
> --- a/drivers/rtc/rtc-at91rm9200.c
> +++ b/drivers/rtc/rtc-at91rm9200.c
> @@ -440,7 +440,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>  	rtc->ops = &at91_rtc_ops;
>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
> -	ret = rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
>  	if (ret)
>  		goto err_clk;
>  
> diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
> index e39e89867d29..2216be429ab7 100644
> --- a/drivers/rtc/rtc-at91sam9.c
> +++ b/drivers/rtc/rtc-at91sam9.c
> @@ -431,7 +431,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
>  		dev_warn(&pdev->dev, "%s: SET TIME!\n",
>  			 dev_name(&rtc->rtcdev->dev));
>  
> -	return rtc_register_device(rtc->rtcdev);
> +	return devm_rtc_register_device(rtc->rtcdev);
>  
>  err_clk:
>  	clk_disable_unprepare(rtc->sclk);
> diff --git a/drivers/rtc/rtc-au1xxx.c b/drivers/rtc/rtc-au1xxx.c
> index 791bebcb6f47..e6428b27b5d4 100644
> --- a/drivers/rtc/rtc-au1xxx.c
> +++ b/drivers/rtc/rtc-au1xxx.c
> @@ -104,7 +104,7 @@ static int au1xtoy_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rtcdev);
>  
> -	return rtc_register_device(rtcdev);
> +	return devm_rtc_register_device(rtcdev);
>  }
>  
>  static struct platform_driver au1xrtc_driver = {
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 4492b770422c..17cb67f5bf6e 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -604,7 +604,7 @@ static int bd70528_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static const struct platform_device_id bd718x7_rtc_id[] = {
> diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
> index 4fee57c51280..560465b57419 100644
> --- a/drivers/rtc/rtc-brcmstb-waketimer.c
> +++ b/drivers/rtc/rtc-brcmstb-waketimer.c
> @@ -252,7 +252,7 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
>  	timer->rtc->ops = &brcmstb_waketmr_ops;
>  	timer->rtc->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(timer->rtc);
> +	ret = devm_rtc_register_device(timer->rtc);
>  	if (ret)
>  		goto err_notifier;
>  
> diff --git a/drivers/rtc/rtc-cadence.c b/drivers/rtc/rtc-cadence.c
> index 595d5d252850..1edf7f16d73a 100644
> --- a/drivers/rtc/rtc-cadence.c
> +++ b/drivers/rtc/rtc-cadence.c
> @@ -336,7 +336,7 @@ static int cdns_rtc_probe(struct platform_device *pdev)
>  	writel(0, crtc->regs + CDNS_RTC_HMR);
>  	writel(CDNS_RTC_KRTCR_KRTC, crtc->regs + CDNS_RTC_KRTCR);
>  
> -	ret = rtc_register_device(crtc->rtc_dev);
> +	ret = devm_rtc_register_device(crtc->rtc_dev);
>  	if (ret)
>  		goto err_disable_wakeup;
>  
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 766074c04b53..83415600185c 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -863,7 +863,7 @@ cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
>  		cmos_rtc.rtc->ops = &cmos_rtc_ops_no_alarm;
>  	}
>  
> -	retval = rtc_register_device(cmos_rtc.rtc);
> +	retval = devm_rtc_register_device(cmos_rtc.rtc);
>  	if (retval)
>  		goto cleanup2;
>  
> diff --git a/drivers/rtc/rtc-coh901331.c b/drivers/rtc/rtc-coh901331.c
> index da59917c9ee8..168ced87d93a 100644
> --- a/drivers/rtc/rtc-coh901331.c
> +++ b/drivers/rtc/rtc-coh901331.c
> @@ -203,7 +203,7 @@ static int __init coh901331_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rtap);
>  
> -	ret = rtc_register_device(rtap->rtc);
> +	ret = devm_rtc_register_device(rtap->rtc);
>  	if (ret)
>  		goto out_no_rtc;
>  
> diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
> index 800667d73a6f..8f8369507103 100644
> --- a/drivers/rtc/rtc-cpcap.c
> +++ b/drivers/rtc/rtc-cpcap.c
> @@ -299,7 +299,7 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
>  		/* ignore error and continue without wakeup support */
>  	}
>  
> -	return rtc_register_device(rtc->rtc_dev);
> +	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
>  static const struct of_device_id cpcap_rtc_of_match[] = {
> diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
> index f7343c289cab..70626793ca69 100644
> --- a/drivers/rtc/rtc-cros-ec.c
> +++ b/drivers/rtc/rtc-cros-ec.c
> @@ -350,7 +350,7 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
>  	cros_ec_rtc->rtc->ops = &cros_ec_rtc_ops;
>  	cros_ec_rtc->rtc->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(cros_ec_rtc->rtc);
> +	ret = devm_rtc_register_device(cros_ec_rtc->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-da9052.c b/drivers/rtc/rtc-da9052.c
> index 58de10da37b1..9ca99bd35702 100644
> --- a/drivers/rtc/rtc-da9052.c
> +++ b/drivers/rtc/rtc-da9052.c
> @@ -304,7 +304,7 @@ static int da9052_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rtc->rtc->range_max = RTC_TIMESTAMP_END_2063;
>  
> -	ret = rtc_register_device(rtc->rtc);
> +	ret = devm_rtc_register_device(rtc->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
> index 046b1d4c3dae..03a55a3e2433 100644
> --- a/drivers/rtc/rtc-da9063.c
> +++ b/drivers/rtc/rtc-da9063.c
> @@ -494,7 +494,7 @@ static int da9063_rtc_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
>  			irq_alarm, ret);
>  
> -	return rtc_register_device(rtc->rtc_dev);
> +	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
>  static struct platform_driver da9063_rtc_driver = {
> diff --git a/drivers/rtc/rtc-davinci.c b/drivers/rtc/rtc-davinci.c
> index 73f87a17cdf3..6bef0f2353da 100644
> --- a/drivers/rtc/rtc-davinci.c
> +++ b/drivers/rtc/rtc-davinci.c
> @@ -484,7 +484,7 @@ static int __init davinci_rtc_probe(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, 0);
>  
> -	return rtc_register_device(davinci_rtc->rtc);
> +	return devm_rtc_register_device(davinci_rtc->rtc);
>  }
>  
>  static int __exit davinci_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/rtc-digicolor.c b/drivers/rtc/rtc-digicolor.c
> index 200d85b01e8b..4fdfa5b6feb2 100644
> --- a/drivers/rtc/rtc-digicolor.c
> +++ b/drivers/rtc/rtc-digicolor.c
> @@ -202,7 +202,7 @@ static int __init dc_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc_dev->ops = &dc_rtc_ops;
>  	rtc->rtc_dev->range_max = U32_MAX;
>  
> -	return rtc_register_device(rtc->rtc_dev);
> +	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
>  static const struct of_device_id dc_dt_ids[] = {
> diff --git a/drivers/rtc/rtc-dm355evm.c b/drivers/rtc/rtc-dm355evm.c
> index cd947a20843b..94fb16ac3e0f 100644
> --- a/drivers/rtc/rtc-dm355evm.c
> +++ b/drivers/rtc/rtc-dm355evm.c
> @@ -132,7 +132,7 @@ static int dm355evm_rtc_probe(struct platform_device *pdev)
>  	rtc->ops = &dm355evm_rtc_ops;
>  	rtc->range_max = U32_MAX;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  /*
> diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
> index a4e768261b43..8c2ab29c3d91 100644
> --- a/drivers/rtc/rtc-ds1305.c
> +++ b/drivers/rtc/rtc-ds1305.c
> @@ -694,7 +694,7 @@ static int ds1305_probe(struct spi_device *spi)
>  	ds1305->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
>  	ds1305_nvmem_cfg.priv = ds1305;
> -	status = rtc_register_device(ds1305->rtc);
> +	status = devm_rtc_register_device(ds1305->rtc);
>  	if (status)
>  		return status;
>  
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 1dc377e0b225..97b086441b17 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -2032,7 +2032,7 @@ static int ds1307_probe(struct i2c_client *client,
>  	if (err)
>  		return err;
>  
> -	err = rtc_register_device(ds1307->rtc);
> +	err = devm_rtc_register_device(ds1307->rtc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
> index ea663e24a34c..f14ed6c96437 100644
> --- a/drivers/rtc/rtc-ds1343.c
> +++ b/drivers/rtc/rtc-ds1343.c
> @@ -408,7 +408,7 @@ static int ds1343_probe(struct spi_device *spi)
>  		dev_err(&spi->dev,
>  			"unable to create sysfs entries for rtc ds1343\n");
>  
> -	res = rtc_register_device(priv->rtc);
> +	res = devm_rtc_register_device(priv->rtc);
>  	if (res)
>  		return res;
>  
> diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
> index 7025cf3fb9f8..157bf5209ac4 100644
> --- a/drivers/rtc/rtc-ds1347.c
> +++ b/drivers/rtc/rtc-ds1347.c
> @@ -166,7 +166,7 @@ static int ds1347_probe(struct spi_device *spi)
>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_0000;
>  	rtc->range_max = RTC_TIMESTAMP_END_9999;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct spi_driver ds1347_driver = {
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 177d870bda0d..fab79921a712 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -508,7 +508,7 @@ static int ds1374_probe(struct i2c_client *client,
>  	ds1374->rtc->ops = &ds1374_rtc_ops;
>  	ds1374->rtc->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(ds1374->rtc);
> +	ret = devm_rtc_register_device(ds1374->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-ds1511.c b/drivers/rtc/rtc-ds1511.c
> index d5f48216e851..bda884333082 100644
> --- a/drivers/rtc/rtc-ds1511.c
> +++ b/drivers/rtc/rtc-ds1511.c
> @@ -466,7 +466,7 @@ static int ds1511_rtc_probe(struct platform_device *pdev)
>  
>  	pdata->rtc->ops = &ds1511_rtc_ops;
>  
> -	ret = rtc_register_device(pdata->rtc);
> +	ret = devm_rtc_register_device(pdata->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-ds1553.c b/drivers/rtc/rtc-ds1553.c
> index bb40ea8b6373..dbff5b621ef5 100644
> --- a/drivers/rtc/rtc-ds1553.c
> +++ b/drivers/rtc/rtc-ds1553.c
> @@ -295,7 +295,7 @@ static int ds1553_rtc_probe(struct platform_device *pdev)
>  
>  	pdata->rtc->ops = &ds1553_rtc_ops;
>  
> -	ret = rtc_register_device(pdata->rtc);
> +	ret = devm_rtc_register_device(pdata->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c
> index 9da84df9f152..630493759d15 100644
> --- a/drivers/rtc/rtc-ds1672.c
> +++ b/drivers/rtc/rtc-ds1672.c
> @@ -124,7 +124,7 @@ static int ds1672_probe(struct i2c_client *client,
>  	rtc->ops = &ds1672_rtc_ops;
>  	rtc->range_max = U32_MAX;
>  
> -	err = rtc_register_device(rtc);
> +	err = devm_rtc_register_device(rtc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index bef588fce266..d69c807af29b 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -1321,7 +1321,7 @@ ds1685_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return rtc_register_device(rtc_dev);
> +	return devm_rtc_register_device(rtc_dev);
>  }
>  
>  /**
> diff --git a/drivers/rtc/rtc-ds1742.c b/drivers/rtc/rtc-ds1742.c
> index 39c6c3a85b34..13d45c697da6 100644
> --- a/drivers/rtc/rtc-ds1742.c
> +++ b/drivers/rtc/rtc-ds1742.c
> @@ -191,7 +191,7 @@ static int ds1742_rtc_probe(struct platform_device *pdev)
>  
>  	rtc->ops = &ds1742_rtc_ops;
>  
> -	ret = rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-ds2404.c b/drivers/rtc/rtc-ds2404.c
> index 9df0c44512b8..0480f592307e 100644
> --- a/drivers/rtc/rtc-ds2404.c
> +++ b/drivers/rtc/rtc-ds2404.c
> @@ -234,7 +234,7 @@ static int rtc_probe(struct platform_device *pdev)
>  	chip->rtc->ops = &ds2404_rtc_ops;
>  	chip->rtc->range_max = U32_MAX;
>  
> -	retval = rtc_register_device(chip->rtc);
> +	retval = devm_rtc_register_device(chip->rtc);
>  	if (retval)
>  		return retval;
>  
> diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
> index 8ec9ea1ca72e..9a5a15cbcd9b 100644
> --- a/drivers/rtc/rtc-ep93xx.c
> +++ b/drivers/rtc/rtc-ep93xx.c
> @@ -145,7 +145,7 @@ static int ep93xx_rtc_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	return rtc_register_device(ep93xx_rtc->rtc);
> +	return devm_rtc_register_device(ep93xx_rtc->rtc);
>  }
>  
>  static struct platform_driver ep93xx_rtc_driver = {
> diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
> index 48d3b38ea348..57cc09d0a806 100644
> --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -290,7 +290,7 @@ static int ftm_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		dev_err(&pdev->dev, "failed to enable irq wake\n");
>  
> -	ret = rtc_register_device(rtc->rtc_dev);
> +	ret = devm_rtc_register_device(rtc->rtc_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't register rtc device\n");
>  		return ret;
> diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
> index 0919f7dc94a3..ad3add5db4c8 100644
> --- a/drivers/rtc/rtc-ftrtc010.c
> +++ b/drivers/rtc/rtc-ftrtc010.c
> @@ -176,7 +176,7 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
>  	if (unlikely(ret))
>  		return ret;
>  
> -	return rtc_register_device(rtc->rtc_dev);
> +	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
>  static int ftrtc010_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
> index 6349d2cd3680..7ab95d052644 100644
> --- a/drivers/rtc/rtc-goldfish.c
> +++ b/drivers/rtc/rtc-goldfish.c
> @@ -194,7 +194,7 @@ static int goldfish_rtc_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	return rtc_register_device(rtcdrv->rtc);
> +	return devm_rtc_register_device(rtcdrv->rtc);
>  }
>  
>  static const struct of_device_id goldfish_rtc_of_match[] = {
> diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
> index a5f59e6f862e..cc9fbab49999 100644
> --- a/drivers/rtc/rtc-imx-sc.c
> +++ b/drivers/rtc/rtc-imx-sc.c
> @@ -166,7 +166,7 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
>  	imx_sc_rtc->range_min = 0;
>  	imx_sc_rtc->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(imx_sc_rtc);
> +	ret = devm_rtc_register_device(imx_sc_rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
> index 8d141d8a5490..c2692da74e09 100644
> --- a/drivers/rtc/rtc-imxdi.c
> +++ b/drivers/rtc/rtc-imxdi.c
> @@ -814,7 +814,7 @@ static int __init dryice_rtc_probe(struct platform_device *pdev)
>  	imxdi->rtc->ops = &dryice_rtc_ops;
>  	imxdi->rtc->range_max = U32_MAX;
>  
> -	rc = rtc_register_device(imxdi->rtc);
> +	rc = devm_rtc_register_device(imxdi->rtc);
>  	if (rc)
>  		goto err;
>  
> diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
> index fff8d8253669..1fc6627d854d 100644
> --- a/drivers/rtc/rtc-isl12026.c
> +++ b/drivers/rtc/rtc-isl12026.c
> @@ -469,7 +469,7 @@ static int isl12026_probe_new(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> -	return rtc_register_device(priv->rtc);
> +	return devm_rtc_register_device(priv->rtc);
>  }
>  
>  static int isl12026_remove(struct i2c_client *client)
> diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
> index 08d778b10e9e..563a6d9c9fcf 100644
> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c
> @@ -894,7 +894,7 @@ isl1208_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	if (rc)
>  		return rc;
>  
> -	return rtc_register_device(isl1208->rtc);
> +	return devm_rtc_register_device(isl1208->rtc);
>  }
>  
>  static struct i2c_driver isl1208_driver = {
> diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> index 9607e6b6e0b3..6e51df72fd65 100644
> --- a/drivers/rtc/rtc-jz4740.c
> +++ b/drivers/rtc/rtc-jz4740.c
> @@ -375,7 +375,7 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
>  	/* Each 1 Hz pulse should happen after (rate) ticks */
>  	jz4740_rtc_reg_write(rtc, JZ_REG_RTC_REGULATOR, rate - 1);
>  
> -	ret = rtc_register_device(rtc->rtc);
> +	ret = devm_rtc_register_device(rtc->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-lpc32xx.c b/drivers/rtc/rtc-lpc32xx.c
> index 15d8abda81fe..76ad7031a13d 100644
> --- a/drivers/rtc/rtc-lpc32xx.c
> +++ b/drivers/rtc/rtc-lpc32xx.c
> @@ -239,7 +239,7 @@ static int lpc32xx_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc->ops = &lpc32xx_rtc_ops;
>  	rtc->rtc->range_max = U32_MAX;
>  
> -	err = rtc_register_device(rtc->rtc);
> +	err = devm_rtc_register_device(rtc->rtc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/rtc/rtc-ls1x.c b/drivers/rtc/rtc-ls1x.c
> index 8bd34056fea0..5af26dc5c2a3 100644
> --- a/drivers/rtc/rtc-ls1x.c
> +++ b/drivers/rtc/rtc-ls1x.c
> @@ -176,7 +176,7 @@ static int ls1x_rtc_probe(struct platform_device *pdev)
>  	rtcdev->range_min = RTC_TIMESTAMP_BEGIN_1900;
>  	rtcdev->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	return rtc_register_device(rtcdev);
> +	return devm_rtc_register_device(rtcdev);
>  }
>  
>  static struct platform_driver  ls1x_rtc_driver = {
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 8a89bc52b0d4..160dcf68e64e 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -977,7 +977,7 @@ static int m41t80_probe(struct i2c_client *client,
>  		m41t80_sqw_register_clk(m41t80_data);
>  #endif
>  
> -	rc = rtc_register_device(m41t80_data->rtc);
> +	rc = devm_rtc_register_device(m41t80_data->rtc);
>  	if (rc)
>  		return rc;
>  
> diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
> index e966a66ab2d3..5f5898d3b055 100644
> --- a/drivers/rtc/rtc-m48t59.c
> +++ b/drivers/rtc/rtc-m48t59.c
> @@ -470,7 +470,7 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = rtc_register_device(m48t59->rtc);
> +	ret = devm_rtc_register_device(m48t59->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
> index 182cfe59e4e0..481c9525b1dd 100644
> --- a/drivers/rtc/rtc-m48t86.c
> +++ b/drivers/rtc/rtc-m48t86.c
> @@ -255,7 +255,7 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
>  
>  	info->rtc->ops = &m48t86_rtc_ops;
>  
> -	err = rtc_register_device(info->rtc);
> +	err = devm_rtc_register_device(info->rtc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/rtc/rtc-mc13xxx.c b/drivers/rtc/rtc-mc13xxx.c
> index d6802e6191cb..d4234e78497e 100644
> --- a/drivers/rtc/rtc-mc13xxx.c
> +++ b/drivers/rtc/rtc-mc13xxx.c
> @@ -307,7 +307,7 @@ static int __init mc13xxx_rtc_probe(struct platform_device *pdev)
>  
>  	mc13xxx_unlock(mc13xxx);
>  
> -	ret = rtc_register_device(priv->rtc);
> +	ret = devm_rtc_register_device(priv->rtc);
>  	if (ret) {
>  		mc13xxx_lock(mc13xxx);
>  		goto err_irq_request;
> diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
> index e6bd0808a092..1463c8621561 100644
> --- a/drivers/rtc/rtc-meson-vrtc.c
> +++ b/drivers/rtc/rtc-meson-vrtc.c
> @@ -83,7 +83,7 @@ static int meson_vrtc_probe(struct platform_device *pdev)
>  		return PTR_ERR(vrtc->rtc);
>  
>  	vrtc->rtc->ops = &meson_vrtc_ops;
> -	return rtc_register_device(vrtc->rtc);
> +	return devm_rtc_register_device(vrtc->rtc);
>  }
>  
>  static int __maybe_unused meson_vrtc_suspend(struct device *dev)
> diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
> index 938267713a4d..8642c06565ea 100644
> --- a/drivers/rtc/rtc-meson.c
> +++ b/drivers/rtc/rtc-meson.c
> @@ -369,7 +369,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_disable_vdd;
>  
> -	ret = rtc_register_device(rtc->rtc);
> +	ret = devm_rtc_register_device(rtc->rtc);
>  	if (ret)
>  		goto out_disable_vdd;
>  
> diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
> index 5c2ce71aa044..bb2ea9bc56f2 100644
> --- a/drivers/rtc/rtc-mpc5121.c
> +++ b/drivers/rtc/rtc-mpc5121.c
> @@ -371,7 +371,7 @@ static int mpc5121_rtc_probe(struct platform_device *op)
>  		rtc->rtc->range_max = U32_MAX;
>  	}
>  
> -	err = rtc_register_device(rtc->rtc);
> +	err = devm_rtc_register_device(rtc->rtc);
>  	if (err)
>  		goto out_dispose2;
>  
> diff --git a/drivers/rtc/rtc-mrst.c b/drivers/rtc/rtc-mrst.c
> index 17bf5394e1e5..421b3b6071b6 100644
> --- a/drivers/rtc/rtc-mrst.c
> +++ b/drivers/rtc/rtc-mrst.c
> @@ -361,7 +361,7 @@ static int vrtc_mrst_do_probe(struct device *dev, struct resource *iomem,
>  		}
>  	}
>  
> -	retval = rtc_register_device(mrst_rtc.rtc);
> +	retval = devm_rtc_register_device(mrst_rtc.rtc);
>  	if (retval)
>  		goto cleanup0;
>  
> diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
> index d5f691c8a035..cd92a9788351 100644
> --- a/drivers/rtc/rtc-mt2712.c
> +++ b/drivers/rtc/rtc-mt2712.c
> @@ -352,7 +352,7 @@ static int mt2712_rtc_probe(struct platform_device *pdev)
>  	mt2712_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	mt2712_rtc->rtc->range_max = MT2712_RTC_TIMESTAMP_END_2127;
>  
> -	return rtc_register_device(mt2712_rtc->rtc);
> +	return devm_rtc_register_device(mt2712_rtc->rtc);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 1894aded4c85..6655035e5164 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -301,7 +301,7 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  
>  	rtc->rtc_dev->ops = &mtk_rtc_ops;
>  
> -	return rtc_register_device(rtc->rtc_dev);
> +	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
> index d5f190e578e4..f8e2ecea1d8d 100644
> --- a/drivers/rtc/rtc-mv.c
> +++ b/drivers/rtc/rtc-mv.c
> @@ -278,7 +278,7 @@ static int __init mv_rtc_probe(struct platform_device *pdev)
>  	pdata->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	pdata->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	ret = rtc_register_device(pdata->rtc);
> +	ret = devm_rtc_register_device(pdata->rtc);
>  	if (!ret)
>  		return 0;
>  out:
> diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
> index a8cfbde048f4..85e23efb8433 100644
> --- a/drivers/rtc/rtc-mxc.c
> +++ b/drivers/rtc/rtc-mxc.c
> @@ -428,7 +428,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
>  			dev_err(&pdev->dev, "failed to enable irq wake\n");
>  	}
>  
> -	ret = rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
>  
>  	return ret;
>  }
> diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
> index 91534560fe2a..0d73f6f0cf9e 100644
> --- a/drivers/rtc/rtc-mxc_v2.c
> +++ b/drivers/rtc/rtc-mxc_v2.c
> @@ -354,7 +354,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = rtc_register_device(pdata->rtc);
> +	ret = devm_rtc_register_device(pdata->rtc);
>  	if (ret < 0)
>  		clk_unprepare(pdata->clk);
>  
> diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
> index e65f79fc7718..dc7db2477f88 100644
> --- a/drivers/rtc/rtc-omap.c
> +++ b/drivers/rtc/rtc-omap.c
> @@ -886,7 +886,7 @@ static int omap_rtc_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> -	ret = rtc_register_device(rtc->rtc);
> +	ret = devm_rtc_register_device(rtc->rtc);
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/rtc/rtc-pcap.c b/drivers/rtc/rtc-pcap.c
> index 178bfb1dea21..8c7a98a5452c 100644
> --- a/drivers/rtc/rtc-pcap.c
> +++ b/drivers/rtc/rtc-pcap.c
> @@ -163,7 +163,7 @@ static int __init pcap_rtc_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	return rtc_register_device(pcap_rtc->rtc);
> +	return devm_rtc_register_device(pcap_rtc->rtc);
>  }
>  
>  static int __exit pcap_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
> index c3691fa4210e..534ffc91eec1 100644
> --- a/drivers/rtc/rtc-pcf2123.c
> +++ b/drivers/rtc/rtc-pcf2123.c
> @@ -434,7 +434,7 @@ static int pcf2123_probe(struct spi_device *spi)
>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
>  	rtc->set_start_time = true;
>  
> -	ret = rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index b803bbbca7b8..c19377fe1f71 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -680,7 +680,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  		return ret;
>  	}
>  
> -	return rtc_register_device(pcf2127->rtc);
> +	return devm_rtc_register_device(pcf2127->rtc);
>  }
>  
>  #ifdef CONFIG_OF
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index c19f139e9b8d..e19cf2adbc35 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -614,7 +614,7 @@ static int pcf85063_probe(struct i2c_client *client)
>  	pcf85063_clkout_register_clk(pcf85063);
>  #endif
>  
> -	return rtc_register_device(pcf85063->rtc);
> +	return devm_rtc_register_device(pcf85063->rtc);
>  }
>  
>  #ifdef CONFIG_OF
> diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
> index 23cf14ca2c96..a574c8d15a5c 100644
> --- a/drivers/rtc/rtc-pcf85363.c
> +++ b/drivers/rtc/rtc-pcf85363.c
> @@ -418,7 +418,7 @@ static int pcf85363_probe(struct i2c_client *client,
>  			pcf85363->rtc->ops = &rtc_ops_alarm;
>  	}
>  
> -	ret = rtc_register_device(pcf85363->rtc);
> +	ret = devm_rtc_register_device(pcf85363->rtc);
>  
>  	for (i = 0; i < config->num_nvram; i++) {
>  		nvmem_cfg[i].priv = pcf85363;
> diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
> index 2dc30eafa639..de3e6c355f2e 100644
> --- a/drivers/rtc/rtc-pcf8563.c
> +++ b/drivers/rtc/rtc-pcf8563.c
> @@ -582,7 +582,7 @@ static int pcf8563_probe(struct i2c_client *client,
>  		}
>  	}
>  
> -	err = rtc_register_device(pcf8563->rtc);
> +	err = devm_rtc_register_device(pcf8563->rtc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
> index 2b6946744654..7fb9145c43bd 100644
> --- a/drivers/rtc/rtc-pic32.c
> +++ b/drivers/rtc/rtc-pic32.c
> @@ -338,7 +338,7 @@ static int pic32_rtc_probe(struct platform_device *pdev)
>  	pdata->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	pdata->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	ret = rtc_register_device(pdata->rtc);
> +	ret = devm_rtc_register_device(pdata->rtc);
>  	if (ret)
>  		goto err_nortc;
>  
> diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
> index ebe03eba8f5f..5a880516f3e8 100644
> --- a/drivers/rtc/rtc-pl030.c
> +++ b/drivers/rtc/rtc-pl030.c
> @@ -121,7 +121,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
>  	if (ret)
>  		goto err_irq;
>  
> -	ret = rtc_register_device(rtc->rtc);
> +	ret = devm_rtc_register_device(rtc->rtc);
>  	if (ret)
>  		goto err_reg;
>  
> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
> index c6b89273feba..041a60365048 100644
> --- a/drivers/rtc/rtc-pl031.c
> +++ b/drivers/rtc/rtc-pl031.c
> @@ -368,7 +368,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>  	ldata->rtc->range_min = vendor->range_min;
>  	ldata->rtc->range_max = vendor->range_max;
>  
> -	ret = rtc_register_device(ldata->rtc);
> +	ret = devm_rtc_register_device(ldata->rtc);
>  	if (ret)
>  		goto out;
>  
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
> index b45ee2cb2c04..0d9dd6faabba 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -508,7 +508,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>  		return rc;
>  	}
>  
> -	return rtc_register_device(rtc_dd->rtc);
> +	return devm_rtc_register_device(rtc_dd->rtc);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/rtc/rtc-ps3.c b/drivers/rtc/rtc-ps3.c
> index f0336d691e6c..6b098734c715 100644
> --- a/drivers/rtc/rtc-ps3.c
> +++ b/drivers/rtc/rtc-ps3.c
> @@ -56,7 +56,7 @@ static int __init ps3_rtc_probe(struct platform_device *dev)
>  
>  	platform_set_drvdata(dev, rtc);
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct platform_driver ps3_rtc_driver = {
> diff --git a/drivers/rtc/rtc-r9701.c b/drivers/rtc/rtc-r9701.c
> index 7ceb968f0e44..60a3c3d7499b 100644
> --- a/drivers/rtc/rtc-r9701.c
> +++ b/drivers/rtc/rtc-r9701.c
> @@ -127,7 +127,7 @@ static int r9701_probe(struct spi_device *spi)
>  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct spi_driver r9701_driver = {
> diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
> index dd1a20977478..e73102a39f1b 100644
> --- a/drivers/rtc/rtc-rc5t619.c
> +++ b/drivers/rtc/rtc-rc5t619.c
> @@ -426,7 +426,7 @@ static int rc5t619_rtc_probe(struct platform_device *pdev)
>  		dev_warn(&pdev->dev, "rc5t619 interrupt is disabled\n");
>  	}
>  
> -	return rtc_register_device(rtc->rtc);
> +	return devm_rtc_register_device(rtc->rtc);
>  }
>  
>  static struct platform_driver rc5t619_rtc_driver = {
> diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
> index c0334c602e88..e920da8c08da 100644
> --- a/drivers/rtc/rtc-rk808.c
> +++ b/drivers/rtc/rtc-rk808.c
> @@ -447,7 +447,7 @@ static int rk808_rtc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	return rtc_register_device(rk808_rtc->rtc);
> +	return devm_rtc_register_device(rk808_rtc->rtc);
>  }
>  
>  static struct platform_driver rk808_rtc_driver = {
> diff --git a/drivers/rtc/rtc-rp5c01.c b/drivers/rtc/rtc-rp5c01.c
> index 8bc476c0905f..44afa6d996e7 100644
> --- a/drivers/rtc/rtc-rp5c01.c
> +++ b/drivers/rtc/rtc-rp5c01.c
> @@ -259,7 +259,7 @@ static int __init rp5c01_rtc_probe(struct platform_device *dev)
>  	if (error)
>  		return error;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct platform_driver rp5c01_rtc_driver = {
> diff --git a/drivers/rtc/rtc-rs5c348.c b/drivers/rtc/rtc-rs5c348.c
> index 47c13678449e..fec633f80789 100644
> --- a/drivers/rtc/rtc-rs5c348.c
> +++ b/drivers/rtc/rtc-rs5c348.c
> @@ -197,7 +197,7 @@ static int rs5c348_probe(struct spi_device *spi)
>  
>  	rtc->ops = &rs5c348_rtc_ops;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct spi_driver rs5c348_driver = {
> diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
> index f788df979750..979407a51c7a 100644
> --- a/drivers/rtc/rtc-rv3028.c
> +++ b/drivers/rtc/rtc-rv3028.c
> @@ -886,7 +886,7 @@ static int rv3028_probe(struct i2c_client *client)
>  	rv3028->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rv3028->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  	rv3028->rtc->ops = &rv3028_rtc_ops;
> -	ret = rtc_register_device(rv3028->rtc);
> +	ret = devm_rtc_register_device(rv3028->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
> index ad359b3b74b2..dc1bda62095e 100644
> --- a/drivers/rtc/rtc-rv3029c2.c
> +++ b/drivers/rtc/rtc-rv3029c2.c
> @@ -750,7 +750,7 @@ static int rv3029_probe(struct device *dev, struct regmap *regmap, int irq,
>  	rv3029->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rv3029->rtc->range_max = RTC_TIMESTAMP_END_2079;
>  
> -	rc = rtc_register_device(rv3029->rtc);
> +	rc = devm_rtc_register_device(rv3029->rtc);
>  	if (rc)
>  		return rc;
>  
> diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
> index c95fa7cd0bfe..09d9527a3637 100644
> --- a/drivers/rtc/rtc-rv3032.c
> +++ b/drivers/rtc/rtc-rv3032.c
> @@ -885,7 +885,7 @@ static int rv3032_probe(struct i2c_client *client)
>  	rv3032->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rv3032->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  	rv3032->rtc->ops = &rv3032_rtc_ops;
> -	ret = rtc_register_device(rv3032->rtc);
> +	ret = devm_rtc_register_device(rv3032->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 44e1818a751c..d4ea6db51b26 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -587,7 +587,7 @@ static int rv8803_probe(struct i2c_client *client,
>  	rv8803->rtc->ops = &rv8803_rtc_ops;
>  	rv8803->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rv8803->rtc->range_max = RTC_TIMESTAMP_END_2099;
> -	err = rtc_register_device(rv8803->rtc);
> +	err = devm_rtc_register_device(rv8803->rtc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> index dca41a2a39b2..8340ab47a059 100644
> --- a/drivers/rtc/rtc-rx8010.c
> +++ b/drivers/rtc/rtc-rx8010.c
> @@ -419,7 +419,7 @@ static int rx8010_probe(struct i2c_client *client)
>  	rx8010->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rx8010->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	return rtc_register_device(rx8010->rtc);
> +	return devm_rtc_register_device(rx8010->rtc);
>  }
>  
>  static struct i2c_driver rx8010_driver = {
> diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
> index 017f74721cc0..de109139529b 100644
> --- a/drivers/rtc/rtc-rx8581.c
> +++ b/drivers/rtc/rtc-rx8581.c
> @@ -298,7 +298,7 @@ static int rx8581_probe(struct i2c_client *client,
>  	rx8581->rtc->start_secs = 0;
>  	rx8581->rtc->set_start_time = true;
>  
> -	ret = rtc_register_device(rx8581->rtc);
> +	ret = devm_rtc_register_device(rx8581->rtc);
>  
>  	for (i = 0; i < config->num_nvram; i++) {
>  		nvmem_cfg[i].priv = rx8581;
> diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> index 03672a246356..ea15d0392bb9 100644
> --- a/drivers/rtc/rtc-s35390a.c
> +++ b/drivers/rtc/rtc-s35390a.c
> @@ -497,7 +497,7 @@ static int s35390a_probe(struct i2c_client *client,
>  	if (status1 & S35390A_FLAG_INT2)
>  		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
>  
> -	return rtc_register_device(s35390a->rtc);
> +	return devm_rtc_register_device(s35390a->rtc);
>  }
>  
>  static struct i2c_driver s35390a_driver = {
> diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
> index 9ccc97cf5e09..1250887e4382 100644
> --- a/drivers/rtc/rtc-sa1100.c
> +++ b/drivers/rtc/rtc-sa1100.c
> @@ -205,7 +205,7 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
>  	info->rtc->max_user_freq = RTC_FREQ;
>  	info->rtc->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(info->rtc);
> +	ret = devm_rtc_register_device(info->rtc);
>  	if (ret) {
>  		clk_disable_unprepare(info->clk);
>  		return ret;
> diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
> index 8e3d6be990c5..324398fefc4f 100644
> --- a/drivers/rtc/rtc-sc27xx.c
> +++ b/drivers/rtc/rtc-sc27xx.c
> @@ -648,7 +648,7 @@ static int sprd_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc->ops = &sprd_rtc_ops;
>  	rtc->rtc->range_min = 0;
>  	rtc->rtc->range_max = 5662310399LL;
> -	ret = rtc_register_device(rtc->rtc);
> +	ret = devm_rtc_register_device(rtc->rtc);
>  	if (ret) {
>  		device_init_wakeup(&pdev->dev, 0);
>  		return ret;
> diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
> index a7aa943c1183..f6bee69ba017 100644
> --- a/drivers/rtc/rtc-sd3078.c
> +++ b/drivers/rtc/rtc-sd3078.c
> @@ -192,7 +192,7 @@ static int sd3078_probe(struct i2c_client *client,
>  	sd3078->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	sd3078->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	ret = rtc_register_device(sd3078->rtc);
> +	ret = devm_rtc_register_device(sd3078->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
> index 9167b48014a1..cd146b574143 100644
> --- a/drivers/rtc/rtc-sh.c
> +++ b/drivers/rtc/rtc-sh.c
> @@ -607,7 +607,7 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
>  		rtc->rtc_dev->range_max = mktime64(2098, 12, 31, 23, 59, 59);
>  	}
>  
> -	ret = rtc_register_device(rtc->rtc_dev);
> +	ret = devm_rtc_register_device(rtc->rtc_dev);
>  	if (ret)
>  		goto err_unmap;
>  
> diff --git a/drivers/rtc/rtc-sirfsoc.c b/drivers/rtc/rtc-sirfsoc.c
> index abf19435dbad..03a6cca23201 100644
> --- a/drivers/rtc/rtc-sirfsoc.c
> +++ b/drivers/rtc/rtc-sirfsoc.c
> @@ -356,7 +356,7 @@ static int sirfsoc_rtc_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	return rtc_register_device(rtcdrv->rtc);
> +	return devm_rtc_register_device(rtcdrv->rtc);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> index 0263d996b8a8..b5f1791a7255 100644
> --- a/drivers/rtc/rtc-snvs.c
> +++ b/drivers/rtc/rtc-snvs.c
> @@ -405,7 +405,7 @@ static int snvs_rtc_probe(struct platform_device *pdev)
>  	data->rtc->ops = &snvs_rtc_ops;
>  	data->rtc->range_max = U32_MAX;
>  
> -	return rtc_register_device(data->rtc);
> +	return devm_rtc_register_device(data->rtc);
>  }
>  
>  static int __maybe_unused snvs_rtc_suspend_noirq(struct device *dev)
> diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
> index 0c65448b85ee..bdb20f63254e 100644
> --- a/drivers/rtc/rtc-st-lpc.c
> +++ b/drivers/rtc/rtc-st-lpc.c
> @@ -250,7 +250,7 @@ static int st_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc_dev->range_max = U64_MAX;
>  	do_div(rtc->rtc_dev->range_max, rtc->clkrate);
>  
> -	ret = rtc_register_device(rtc->rtc_dev);
> +	ret = devm_rtc_register_device(rtc->rtc_dev);
>  	if (ret) {
>  		clk_disable_unprepare(rtc->clk);
>  		return ret;
> diff --git a/drivers/rtc/rtc-starfire.c b/drivers/rtc/rtc-starfire.c
> index 37a26279e107..fbd1ed41cbf1 100644
> --- a/drivers/rtc/rtc-starfire.c
> +++ b/drivers/rtc/rtc-starfire.c
> @@ -48,7 +48,7 @@ static int __init starfire_rtc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, rtc);
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct platform_driver starfire_rtc_driver = {
> diff --git a/drivers/rtc/rtc-stk17ta8.c b/drivers/rtc/rtc-stk17ta8.c
> index ad616bce7bca..7cb6be1b7815 100644
> --- a/drivers/rtc/rtc-stk17ta8.c
> +++ b/drivers/rtc/rtc-stk17ta8.c
> @@ -317,7 +317,7 @@ static int stk17ta8_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return rtc_register_device(pdata->rtc);
> +	return devm_rtc_register_device(pdata->rtc);
>  }
>  
>  /* work with hotplug and coldplug */
> diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
> index 0a969af80af7..40c0f7ed36e0 100644
> --- a/drivers/rtc/rtc-stmp3xxx.c
> +++ b/drivers/rtc/rtc-stmp3xxx.c
> @@ -366,7 +366,7 @@ static int stmp3xxx_rtc_probe(struct platform_device *pdev)
>  	rtc_data->rtc->ops = &stmp3xxx_rtc_ops;
>  	rtc_data->rtc->range_max = U32_MAX;
>  
> -	err = rtc_register_device(rtc_data->rtc);
> +	err = devm_rtc_register_device(rtc_data->rtc);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/rtc/rtc-sun4v.c b/drivers/rtc/rtc-sun4v.c
> index 036463dfa103..a86e27de8c06 100644
> --- a/drivers/rtc/rtc-sun4v.c
> +++ b/drivers/rtc/rtc-sun4v.c
> @@ -86,7 +86,7 @@ static int __init sun4v_rtc_probe(struct platform_device *pdev)
>  	rtc->range_max = U64_MAX;
>  	platform_set_drvdata(pdev, rtc);
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct platform_driver sun4v_rtc_driver = {
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index e2b8b150bcb4..9739f8640f63 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -724,7 +724,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
>  	chip->rtc->ops = &sun6i_rtc_ops;
>  	chip->rtc->range_max = 2019686399LL; /* 2033-12-31 23:59:59 */
>  
> -	ret = rtc_register_device(chip->rtc);
> +	ret = devm_rtc_register_device(chip->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-sunxi.c b/drivers/rtc/rtc-sunxi.c
> index f5d7f44550ce..5d019e3a835a 100644
> --- a/drivers/rtc/rtc-sunxi.c
> +++ b/drivers/rtc/rtc-sunxi.c
> @@ -470,7 +470,7 @@ static int sunxi_rtc_probe(struct platform_device *pdev)
>  
>  	chip->rtc->ops = &sunxi_rtc_ops;
>  
> -	return rtc_register_device(chip->rtc);
> +	return devm_rtc_register_device(chip->rtc);
>  }
>  
>  static struct platform_driver sunxi_rtc_driver = {
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> index 7fbb1741692f..8925015cc698 100644
> --- a/drivers/rtc/rtc-tegra.c
> +++ b/drivers/rtc/rtc-tegra.c
> @@ -329,7 +329,7 @@ static int tegra_rtc_probe(struct platform_device *pdev)
>  		goto disable_clk;
>  	}
>  
> -	ret = rtc_register_device(info->rtc);
> +	ret = devm_rtc_register_device(info->rtc);
>  	if (ret)
>  		goto disable_clk;
>  
> diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
> index 74b3a0603b73..b092a1648513 100644
> --- a/drivers/rtc/rtc-test.c
> +++ b/drivers/rtc/rtc-test.c
> @@ -139,7 +139,7 @@ static int test_probe(struct platform_device *plat_dev)
>  	timer_setup(&rtd->alarm, test_rtc_alarm_handler, 0);
>  	rtd->alarm.expires = 0;
>  
> -	return rtc_register_device(rtd->rtc);
> +	return devm_rtc_register_device(rtd->rtc);
>  }
>  
>  static struct platform_driver test_driver = {
> diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
> index e39af2d67051..a980337c3065 100644
> --- a/drivers/rtc/rtc-tps6586x.c
> +++ b/drivers/rtc/rtc-tps6586x.c
> @@ -280,7 +280,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
>  		goto fail_rtc_register;
>  	}
>  
> -	ret = rtc_register_device(rtc->rtc);
> +	ret = devm_rtc_register_device(rtc->rtc);
>  	if (ret)
>  		goto fail_rtc_register;
>  
> diff --git a/drivers/rtc/rtc-tps65910.c b/drivers/rtc/rtc-tps65910.c
> index e3840386f430..2d87b62826a8 100644
> --- a/drivers/rtc/rtc-tps65910.c
> +++ b/drivers/rtc/rtc-tps65910.c
> @@ -434,7 +434,7 @@ static int tps65910_rtc_probe(struct platform_device *pdev)
>  	tps_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	tps_rtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  
> -	return rtc_register_device(tps_rtc->rtc);
> +	return devm_rtc_register_device(tps_rtc->rtc);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/rtc/rtc-tx4939.c b/drivers/rtc/rtc-tx4939.c
> index 11f46272bad3..c3309db5448d 100644
> --- a/drivers/rtc/rtc-tx4939.c
> +++ b/drivers/rtc/rtc-tx4939.c
> @@ -275,7 +275,7 @@ static int __init tx4939_rtc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static int __exit tx4939_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/rtc-vr41xx.c b/drivers/rtc/rtc-vr41xx.c
> index c3671043ace7..5a9f9ad86d32 100644
> --- a/drivers/rtc/rtc-vr41xx.c
> +++ b/drivers/rtc/rtc-vr41xx.c
> @@ -335,7 +335,7 @@ static int rtc_probe(struct platform_device *pdev)
>  
>  	dev_info(&pdev->dev, "Real Time Clock of NEC VR4100 series\n");
>  
> -	retval = rtc_register_device(rtc);
> +	retval = devm_rtc_register_device(rtc);
>  	if (retval)
>  		goto err_iounmap_all;
>  
> diff --git a/drivers/rtc/rtc-vt8500.c b/drivers/rtc/rtc-vt8500.c
> index e2588625025f..197b649cd629 100644
> --- a/drivers/rtc/rtc-vt8500.c
> +++ b/drivers/rtc/rtc-vt8500.c
> @@ -232,7 +232,7 @@ static int vt8500_rtc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	return rtc_register_device(vt8500_rtc->rtc);
> +	return devm_rtc_register_device(vt8500_rtc->rtc);
>  }
>  
>  static int vt8500_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
> index ff46066a68a4..2a205a646452 100644
> --- a/drivers/rtc/rtc-wilco-ec.c
> +++ b/drivers/rtc/rtc-wilco-ec.c
> @@ -176,7 +176,7 @@ static int wilco_ec_rtc_probe(struct platform_device *pdev)
>  	rtc->range_max = RTC_TIMESTAMP_END_2099;
>  	rtc->owner = THIS_MODULE;
>  
> -	return rtc_register_device(rtc);
> +	return devm_rtc_register_device(rtc);
>  }
>  
>  static struct platform_driver wilco_ec_rtc_driver = {
> diff --git a/drivers/rtc/rtc-wm831x.c b/drivers/rtc/rtc-wm831x.c
> index ccef887d2690..640833e21057 100644
> --- a/drivers/rtc/rtc-wm831x.c
> +++ b/drivers/rtc/rtc-wm831x.c
> @@ -429,7 +429,7 @@ static int wm831x_rtc_probe(struct platform_device *pdev)
>  	wm831x_rtc->rtc->ops = &wm831x_rtc_ops;
>  	wm831x_rtc->rtc->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(wm831x_rtc->rtc);
> +	ret = devm_rtc_register_device(wm831x_rtc->rtc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
> index 96db441f92b3..cf68a9b1c9eb 100644
> --- a/drivers/rtc/rtc-xgene.c
> +++ b/drivers/rtc/rtc-xgene.c
> @@ -185,7 +185,7 @@ static int xgene_rtc_probe(struct platform_device *pdev)
>  	pdata->rtc->ops = &xgene_rtc_ops;
>  	pdata->rtc->range_max = U32_MAX;
>  
> -	ret = rtc_register_device(pdata->rtc);
> +	ret = devm_rtc_register_device(pdata->rtc);
>  	if (ret) {
>  		clk_disable_unprepare(pdata->clk);
>  		return ret;
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 4b1077e2f826..f440bb52be92 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -264,7 +264,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  
> -	return rtc_register_device(xrtcdev->rtc);
> +	return devm_rtc_register_device(xrtcdev->rtc);
>  }
>  
>  static int xlnx_rtc_remove(struct platform_device *pdev)
> diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
> index 950fac0d41ff..8a957d31a1a4 100644
> --- a/drivers/rtc/sysfs.c
> +++ b/drivers/rtc/sysfs.c
> @@ -317,8 +317,6 @@ int rtc_add_groups(struct rtc_device *rtc, const struct attribute_group **grps)
>  	size_t old_cnt = 0, add_cnt = 0, new_cnt;
>  	const struct attribute_group **groups, **old;
>  
> -	if (rtc->registered)
> -		return -EINVAL;
>  	if (!grps)
>  		return -EINVAL;
>  
> diff --git a/include/linux/rtc.h b/include/linux/rtc.h
> index cbca651d8ca4..55e7beed066c 100644
> --- a/include/linux/rtc.h
> +++ b/include/linux/rtc.h
> @@ -118,8 +118,6 @@ struct rtc_device {
>  	 */
>  	long set_offset_nsec;
>  
> -	bool registered;
> -
>  	time64_t range_min;
>  	timeu64_t range_max;
>  	time64_t start_secs;
> @@ -157,7 +155,7 @@ extern struct rtc_device *devm_rtc_device_register(struct device *dev,
>  					const struct rtc_class_ops *ops,
>  					struct module *owner);
>  struct rtc_device *devm_rtc_allocate_device(struct device *dev);
> -int __rtc_register_device(struct module *owner, struct rtc_device *rtc);
> +int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc);
>  
>  extern int rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm);
>  extern int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm);
> @@ -234,8 +232,8 @@ static inline bool rtc_tv_nsec_ok(s64 set_offset_nsec,
>  	return false;
>  }
>  
> -#define rtc_register_device(device) \
> -	__rtc_register_device(THIS_MODULE, device)
> +#define devm_rtc_register_device(device) \
> +	__devm_rtc_register_device(THIS_MODULE, device)
>  
>  #ifdef CONFIG_RTC_HCTOSYS_DEVICE
>  extern int rtc_hctosys_ret;
> -- 
> 2.29.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
