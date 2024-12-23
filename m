Return-Path: <linux-rtc+bounces-2759-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E339FAD67
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 12:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A6818861EF
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294791922F5;
	Mon, 23 Dec 2024 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X9xs9EDw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EC7171CD;
	Mon, 23 Dec 2024 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734951794; cv=none; b=fxdcQ0UJKUxERb+26htcHvm+QRotG4OpV7C4dCcVSBAJAglRzvSiK8KI5kkw90SmagypK0waG2Hukac7r7Tz1YiKKXDl6E1bNuEDPq5kDCXPIu2F84rbrzHgV6J5f9POEHapP8mrdxrqxsWhgKeyiP2FuKVakUnrP8msBAWDhlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734951794; c=relaxed/simple;
	bh=dUSBKskYXRFoM5DaGp/bhTGJJ9wiewmt8Pfz2mbNNKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfHv8U3u466n/VPdv9Ix+qm1CCe8VgPigo3LXbqn4FatbBeHVrTLnzpJ9kiP1CY/Ue+AQT8fC17oMUovzhzQb4Q6KNjkLPYgIK+bmQ3AG3rRbU02L1HyyEAdtu04TPp9lPzdeyjUzhmsw4PpfWEfzKfwoaU/pUOAGgtr2u0uEvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X9xs9EDw; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id A93AEC1287;
	Mon, 23 Dec 2024 10:40:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF191E0007;
	Mon, 23 Dec 2024 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734950396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BrUW4qv5lrJSVhaUsMIOYaQSneI9RWsxcGUjk5A38zA=;
	b=X9xs9EDwnJNIP/3XNa6UHN7dAUvy6OjR7tj2AsNiD7tX8n03QRa1jupwqYDLoFauVU+KEm
	fOIunGfr5nXe/mxhxTD6xGS9c+RrWOh27yIV1V3wtUvqFBnpXFqClKFH/pUV7Tayc0xrkG
	wxmSUERvu0Otlq398jbW4QPthHvGsvkMr/+2UHEMPLjSKvRkIUD1AgPJYDHtvOph44C+R/
	IFE1G0KvBXYRm1lDHUzsi4rvyzItaE2+8Fed9vK3vwc84goT4W4Ww83eEpjPgmKuX1vNk7
	GjBA/CfPuF/a3OaRdAzP1ailE3jNumjCDGN1X1Rn6tSaLFrs3FxJ1gnHpAOFIA==
Date: Mon, 23 Dec 2024 11:39:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	virtio-dev@lists.linux.dev, linux-rtc@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [RFC PATCH v4 4/4] virtio_rtc: Add RTC class driver
Message-ID: <202412231039541ffbdea0@mail.local>
References: <20241219201118.2233-1-quic_philber@quicinc.com>
 <20241219201118.2233-5-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219201118.2233-5-quic_philber@quicinc.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 19/12/2024 21:11:10+0100, Peter Hilber wrote:
> Expose the virtio-rtc UTC-like clock as an RTC clock to userspace - if it
> is present, and if it does not step on leap seconds. The RTC class enables
> the virtio-rtc device to resume the system from sleep states on RTC alarm.
> 
> Support RTC alarm if the virtio-rtc alarm feature is present. The
> virtio-rtc device signals an alarm by marking an alarmq buffer as used.
> 
> Peculiarities
> -------------
> 
> A virtio-rtc clock is a bit special for an RTC clock in that
> 
> - the clock may step (also backwards) autonomously at any time and
> 
> - the device, and its notification mechanism, will be reset during boot or
>   resume from sleep.
> 
> The virtio-rtc device avoids that the driver might miss an alarm. The
> device signals an alarm whenever the clock has reached or passed the alarm
> time, and also when the device is reset (on boot or resume from sleep), if
> the alarm time is in the past.
> 
> Open Issue
> ----------
> 
> The CLOCK_BOOTTIME_ALARM will use the RTC clock to wake up from sleep, and
> implicitly assumes that no RTC clock steps will occur during sleep. The RTC
> class driver does not know whether the current alarm is a real-time alarm
> or a boot-time alarm.
> 
> Perhaps this might be handled by the driver also setting a virtio-rtc
> monotonic alarm (which uses a clock similar to CLOCK_BOOTTIME_ALARM). The
> virtio-rtc monotonic alarm would just be used to wake up in case it was a
> CLOCK_BOOTTIME_ALARM alarm.
> 
> Otherwise, the behavior should not differ from other RTC class drivers.
> 
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> Notes:
>     v4:
>     
>     - Do not create RTC class device for clocks which may step on leap seconds
>       (Alexandre Belloni).
>     
>     - Clear RTC class feature bit instead of defining reduced ops
>       (Alexandre Belloni).
>     
>     - Use macros for 64-bit divisions.
>     
>     - Remove unnecessary memory barrier.
>     
>     - Cosmetic changes.
>     
>     v3:
>     
>     Added.
> 
>  drivers/virtio/Kconfig               |  22 +-
>  drivers/virtio/Makefile              |   1 +
>  drivers/virtio/virtio_rtc_class.c    | 268 +++++++++++++++
>  drivers/virtio/virtio_rtc_driver.c   | 482 ++++++++++++++++++++++++++-
>  drivers/virtio/virtio_rtc_internal.h |  52 +++
>  include/uapi/linux/virtio_rtc.h      |  85 +++++
>  6 files changed, 905 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/virtio/virtio_rtc_class.c
> 
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 3d8b366c0625..6db5235a7693 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -195,7 +195,8 @@ config VIRTIO_RTC
>  	help
>  	 This driver provides current time from a Virtio RTC device. The driver
>  	 provides the time through one or more clocks. The Virtio RTC PTP
> -	 clocks must be enabled to expose the clocks to userspace.
> +	 clocks and/or the Real Time Clock driver for Virtio RTC must be
> +	 enabled to expose the clocks to userspace.
>  
>  	 To compile this code as a module, choose M here: the module will be
>  	 called virtio_rtc.
> @@ -204,8 +205,8 @@ config VIRTIO_RTC
>  
>  if VIRTIO_RTC
>  
> -comment "WARNING: Consider enabling VIRTIO_RTC_PTP."
> -	depends on !VIRTIO_RTC_PTP
> +comment "WARNING: Consider enabling VIRTIO_RTC_PTP and/or VIRTIO_RTC_CLASS."
> +	depends on !VIRTIO_RTC_PTP && !VIRTIO_RTC_CLASS
>  
>  comment "Enable PTP_1588_CLOCK in order to enable VIRTIO_RTC_PTP."
>  	depends on PTP_1588_CLOCK=n
> @@ -234,6 +235,21 @@ config VIRTIO_RTC_ARM
>  
>  	 If unsure, say Y.
>  
> +comment "Enable RTC_CLASS in order to enable VIRTIO_RTC_CLASS."
> +	depends on RTC_CLASS=n
> +
> +config VIRTIO_RTC_CLASS
> +	bool "Real Time Clock driver for Virtio RTC"
> +	default y
> +	depends on RTC_CLASS
> +	help
> +	 This exposes the Virtio RTC UTC-like clock as a Linux Real Time Clock.
> +	 It only has an effect if the Virtio RTC device has a UTC-like clock
> +	 which smears leap seconds to avoid steps. The Real Time Clock is
> +	 read-only, and may support setting an alarm.
> +
> +	 If unsure, say Y.
> +
>  endif # VIRTIO_RTC
>  
>  endif # VIRTIO_MENU
> diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> index dbd77f124ba9..eefcfe90d6b8 100644
> --- a/drivers/virtio/Makefile
> +++ b/drivers/virtio/Makefile
> @@ -18,3 +18,4 @@ obj-$(CONFIG_VIRTIO_RTC) += virtio_rtc.o
>  virtio_rtc-y := virtio_rtc_driver.o
>  virtio_rtc-$(CONFIG_VIRTIO_RTC_PTP) += virtio_rtc_ptp.o
>  virtio_rtc-$(CONFIG_VIRTIO_RTC_ARM) += virtio_rtc_arm.o
> +virtio_rtc-$(CONFIG_VIRTIO_RTC_CLASS) += virtio_rtc_class.o
> diff --git a/drivers/virtio/virtio_rtc_class.c b/drivers/virtio/virtio_rtc_class.c
> new file mode 100644
> index 000000000000..e4a48eafad16
> --- /dev/null
> +++ b/drivers/virtio/virtio_rtc_class.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * virtio_rtc RTC class driver
> + *
> + * Copyright (C) 2023 OpenSynergy GmbH
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/math64.h>
> +#include <linux/overflow.h>
> +#include <linux/rtc.h>
> +#include <linux/time64.h>
> +
> +#include <uapi/linux/virtio_rtc.h>
> +
> +#include "virtio_rtc_internal.h"
> +
> +/**
> + * struct viortc_class - RTC class wrapper
> + * @viortc: virtio_rtc device data
> + * @rtc: RTC device
> + * @vio_clk_id: virtio_rtc clock id
> + * @stopped: Whether RTC ops are disallowed. Access protected by rtc_lock().
> + */
> +struct viortc_class {
> +	struct viortc_dev *viortc;
> +	struct rtc_device *rtc;
> +	u16 vio_clk_id;
> +	bool stopped;
> +};
> +
> +/**
> + * viortc_class_get_locked() - get RTC class wrapper, if ops allowed
> + * @dev: virtio device
> + *
> + * Gets the RTC class wrapper from the virtio device, if it is available and
> + * ops are allowed.
> + *
> + * Context: Caller must hold rtc_lock().
> + * Return: RTC class wrapper if available and ops allowed, ERR_PTR otherwise.
> + */
> +static struct viortc_class *viortc_class_get_locked(struct device *dev)
> +{
> +	struct viortc_class *viortc_class;
> +
> +	viortc_class = viortc_class_from_dev(dev);
> +	if (IS_ERR(viortc_class))
> +		return viortc_class;
> +
> +	if (viortc_class->stopped)
> +		return ERR_PTR(-EBUSY);
> +
> +	return viortc_class;
> +}
> +
> +/**
> + * viortc_class_read_time() - RTC class op read_time
> + * @dev: virtio device
> + * @tm: read time
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +static int viortc_class_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct viortc_class *viortc_class;
> +	time64_t sec;
> +	int ret;
> +	u64 ns;
> +
> +	viortc_class = viortc_class_get_locked(dev);
> +	if (IS_ERR(viortc_class))
> +		return PTR_ERR(viortc_class);
> +
> +	ret = viortc_read(viortc_class->viortc, viortc_class->vio_clk_id, &ns);
> +	if (ret)
> +		return ret;
> +
> +	sec = div_u64(ns, NSEC_PER_SEC);
> +
> +	rtc_time64_to_tm(sec, tm);
> +
> +	return 0;
> +}
> +
> +/**
> + * viortc_class_read_alarm() - RTC class op read_alarm
> + * @dev: virtio device
> + * @alrm: alarm read out
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +static int viortc_class_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct viortc_class *viortc_class;
> +	time64_t alarm_time_sec;
> +	u64 alarm_time_ns;
> +	bool enabled;
> +	int ret;
> +
> +	viortc_class = viortc_class_get_locked(dev);
> +	if (IS_ERR(viortc_class))
> +		return PTR_ERR(viortc_class);
> +
> +	ret = viortc_read_alarm(viortc_class->viortc, viortc_class->vio_clk_id,
> +				&alarm_time_ns, &enabled);
> +	if (ret)
> +		return ret;
> +
> +	alarm_time_sec = div_u64(alarm_time_ns, NSEC_PER_SEC);
> +	rtc_time64_to_tm(alarm_time_sec, &alrm->time);
> +
> +	alrm->enabled = enabled;
> +
> +	return 0;
> +}
> +
> +/**
> + * viortc_class_set_alarm() - RTC class op set_alarm
> + * @dev: virtio device
> + * @alrm: alarm to set
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +static int viortc_class_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct viortc_class *viortc_class;
> +	time64_t alarm_time_sec;
> +	u64 alarm_time_ns;
> +
> +	viortc_class = viortc_class_get_locked(dev);
> +	if (IS_ERR(viortc_class))
> +		return PTR_ERR(viortc_class);
> +
> +	alarm_time_sec = rtc_tm_to_time64(&alrm->time);
> +
> +	if (alarm_time_sec < 0)
> +		return -EINVAL;
> +
> +	if (check_mul_overflow((u64)alarm_time_sec, (u64)NSEC_PER_SEC,
> +			       &alarm_time_ns))
> +		return -EINVAL;
> +
> +	return viortc_set_alarm(viortc_class->viortc, viortc_class->vio_clk_id,
> +				alarm_time_ns, alrm->enabled);
> +}
> +
> +/**
> + * viortc_class_alarm_irq_enable() - RTC class op alarm_irq_enable
> + * @dev: virtio device
> + * @enabled: enable or disable alarm IRQ
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +static int viortc_class_alarm_irq_enable(struct device *dev,
> +					 unsigned int enabled)
> +{
> +	struct viortc_class *viortc_class;
> +
> +	viortc_class = viortc_class_get_locked(dev);
> +	if (IS_ERR(viortc_class))
> +		return PTR_ERR(viortc_class);
> +
> +	return viortc_set_alarm_enabled(viortc_class->viortc,
> +					viortc_class->vio_clk_id, enabled);
> +}
> +
> +static const struct rtc_class_ops viortc_class_ops = {
> +	.read_time = viortc_class_read_time,
> +	.read_alarm = viortc_class_read_alarm,
> +	.set_alarm = viortc_class_set_alarm,
> +	.alarm_irq_enable = viortc_class_alarm_irq_enable,
> +};
> +
> +/**
> + * viortc_class_alarm() - propagate alarm notification as alarm interrupt
> + * @viortc_class: RTC class wrapper
> + * @vio_clk_id: virtio_rtc clock id
> + *
> + * Context: Any context.
> + */
> +void viortc_class_alarm(struct viortc_class *viortc_class, u16 vio_clk_id)
> +{
> +	if (WARN_ONCE(
> +		    !viortc_class,
> +		    "virtio_rtc: unexpected alarm, no RTC class device available\n"))
> +		return;
> +
> +	if (vio_clk_id != viortc_class->vio_clk_id) {
> +		dev_err_ratelimited(&viortc_class->rtc->dev,
> +				    "%s: unexpected clock id %d != %d\n",
> +				    __func__, vio_clk_id,
> +				    viortc_class->vio_clk_id);
> +		return;
> +	}
> +
> +	rtc_update_irq(viortc_class->rtc, 1, RTC_AF | RTC_IRQF);
> +}
> +
> +/**
> + * viortc_class_stop() - disallow RTC class ops
> + * @viortc_class: RTC class wrapper
> + *
> + * Context: Process context. Caller must NOT hold rtc_lock().
> + */
> +void viortc_class_stop(struct viortc_class *viortc_class)
> +{
> +	rtc_lock(viortc_class->rtc);
> +
> +	viortc_class->stopped = true;
> +
> +	rtc_unlock(viortc_class->rtc);
> +}
> +
> +/**
> + * viortc_class_register() - register RTC class device
> + * @viortc_class: RTC class wrapper
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +int viortc_class_register(struct viortc_class *viortc_class)
> +{
> +	return devm_rtc_register_device(viortc_class->rtc);
> +}
> +
> +/**
> + * viortc_class_init() - init RTC class wrapper and device
> + * @viortc: device data
> + * @vio_clk_id: virtio_rtc clock id
> + * @have_alarm: have alarm feature
> + * @parent_dev: virtio device
> + *
> + * Context: Process context.
> + * Return: RTC class wrapper on success, ERR_PTR otherwise.
> + */
> +struct viortc_class *viortc_class_init(struct viortc_dev *viortc,
> +				       u16 vio_clk_id, bool have_alarm,
> +				       struct device *parent_dev)
> +{
> +	struct viortc_class *viortc_class;
> +	struct rtc_device *rtc;
> +
> +	viortc_class =
> +		devm_kzalloc(parent_dev, sizeof(*viortc_class), GFP_KERNEL);
> +	if (!viortc_class)
> +		return ERR_PTR(-ENOMEM);
> +
> +	viortc_class->viortc = viortc;
> +
> +	rtc = devm_rtc_allocate_device(parent_dev);
> +	if (IS_ERR(rtc))
> +		return ERR_CAST(rtc);
> +
> +	viortc_class->rtc = rtc;
> +
> +	if (!have_alarm)
> +		clear_bit(RTC_FEATURE_ALARM, rtc->features);
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> +
> +	rtc->ops = &viortc_class_ops;
> +	rtc->range_max = div_u64(U64_MAX, NSEC_PER_SEC);
> +
> +	return viortc_class;
> +}
> diff --git a/drivers/virtio/virtio_rtc_driver.c b/drivers/virtio/virtio_rtc_driver.c
> index 83f975d9a6ae..f8b890afc528 100644
> --- a/drivers/virtio/virtio_rtc_driver.c
> +++ b/drivers/virtio/virtio_rtc_driver.c
> @@ -10,15 +10,20 @@
>  #include <linux/virtio.h>
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
> +#include <linux/device.h>
>  #include <linux/module.h>
> +#include <linux/pm.h>
>  
>  #include <uapi/linux/virtio_rtc.h>
>  
>  #include "virtio_rtc_internal.h"
>  
> +#define VIORTC_ALARMQ_BUF_CAP sizeof(union virtio_rtc_notif_alarmq)
> +
>  /* virtqueue order */
>  enum {
>  	VIORTC_REQUESTQ,
> +	VIORTC_ALARMQ,
>  	VIORTC_MAX_NR_QUEUES,
>  };
>  
> @@ -35,17 +40,23 @@ struct viortc_vq {
>  /**
>   * struct viortc_dev - virtio_rtc device data
>   * @vdev: virtio device
> + * @viortc_class: RTC class wrapper for UTC-like clock, NULL if not available
>   * @vqs: virtqueues
>   * @clocks_to_unregister: Clock references, which are only used during device
>   *                        removal.
>   *			  For other uses, there would be a race between device
>   *			  creation and setting the pointers here.
> + * @alarmq_bufs: alarmq buffers list
> + * @num_alarmq_bufs: # of alarmq buffers
>   * @num_clocks: # of virtio_rtc clocks
>   */
>  struct viortc_dev {
>  	struct virtio_device *vdev;
> +	struct viortc_class *viortc_class;
>  	struct viortc_vq vqs[VIORTC_MAX_NR_QUEUES];
>  	struct viortc_ptp_clock **clocks_to_unregister;
> +	void **alarmq_bufs;
> +	unsigned int num_alarmq_bufs;
>  	u16 num_clocks;
>  };
>  
> @@ -76,6 +87,60 @@ struct viortc_msg {
>  	unsigned int resp_actual_size;
>  };
>  
> +/**
> + * viortc_class_from_dev() - Get RTC class object from virtio device.
> + * @dev: virtio device
> + *
> + * Context: Any context.
> + * Return: RTC class object if available, ERR_PTR otherwise.
> + */
> +struct viortc_class *viortc_class_from_dev(struct device *dev)
> +{
> +	struct virtio_device *vdev;
> +	struct viortc_dev *viortc;
> +
> +	vdev = container_of(dev, typeof(*vdev), dev);
> +	viortc = vdev->priv;
> +
> +	return viortc->viortc_class ?: ERR_PTR(-ENODEV);
> +}
> +
> +/**
> + * viortc_alarms_supported() - Whether device and driver support alarms.
> + * @vdev: virtio device
> + *
> + * NB: Device and driver may not support alarms for the same clocks.
> + *
> + * Context: Any context.
> + * Return: True if both device and driver can support alarms.
> + */
> +static bool viortc_alarms_supported(struct virtio_device *vdev)
> +{
> +	return IS_ENABLED(CONFIG_VIRTIO_RTC_CLASS) &&
> +	       virtio_has_feature(vdev, VIRTIO_RTC_F_ALARM);
> +}
> +
> +/**
> + * viortc_feed_vq() - Make a device write-only buffer available.
> + * @viortc: device data
> + * @vq: notification virtqueue
> + * @buf: buffer
> + * @buf_len: buffer capacity in bytes
> + * @data: token, identifying buffer
> + *
> + * Context: Caller must prevent concurrent access to vq.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +static int viortc_feed_vq(struct viortc_dev *viortc, struct virtqueue *vq,
> +			  void *buf, unsigned int buf_len, void *data)
> +{
> +	struct scatterlist sg;
> +
> +	sg_init_one(&sg, buf, buf_len);
> +
> +	return virtqueue_add_inbuf(vq, &sg, 1, data, GFP_ATOMIC);
> +}
> +
>  /**
>   * viortc_msg_init() - Allocate and initialize requestq message.
>   * @viortc: device data
> @@ -238,6 +303,81 @@ static void viortc_cb_requestq(struct virtqueue *vq)
>  	viortc_do_cb(vq, viortc_requestq_hdlr);
>  }
>  
> +/**
> + * viortc_alarmq_hdlr() - process an alarmq used buffer
> + * @token: token identifying the buffer
> + * @len: bytes written by device
> + * @vq: virtqueue
> + * @viortc_vq: device specific data for virtqueue
> + * @viortc: device data
> + *
> + * Processes a VIRTIO_RTC_NOTIF_ALARM notification by calling the RTC class
> + * driver. Makes the buffer available again.
> + *
> + * Context: virtqueue callback
> + */
> +static void viortc_alarmq_hdlr(void *token, unsigned int len,
> +			       struct virtqueue *vq,
> +			       struct viortc_vq *viortc_vq,
> +			       struct viortc_dev *viortc)
> +{
> +	struct virtio_rtc_notif_alarm *notif = token;
> +	struct virtio_rtc_notif_head *head = token;
> +	unsigned long flags;
> +	u16 clock_id;
> +	bool notify;
> +
> +	if (len < sizeof(*head)) {
> +		dev_err_ratelimited(
> +			&viortc->vdev->dev,
> +			"%s: ignoring notification with short header\n",
> +			__func__);
> +		goto feed_vq;
> +	}
> +
> +	if (virtio_le_to_cpu(head->msg_type) != VIRTIO_RTC_NOTIF_ALARM) {
> +		dev_err_ratelimited(&viortc->vdev->dev,
> +				    "%s: unknown notification type\n",
> +				    __func__);
> +		goto feed_vq;
> +	}
> +
> +	if (len < sizeof(*notif)) {
> +		dev_err_ratelimited(&viortc->vdev->dev,
> +				    "%s: alarm notification too small\n",
> +				    __func__);
> +		goto feed_vq;
> +	}
> +
> +	clock_id = virtio_le_to_cpu(notif->clock_id);
> +
> +	viortc_class_alarm(viortc->viortc_class, clock_id);
> +
> +feed_vq:
> +	spin_lock_irqsave(&viortc_vq->lock, flags);
> +
> +	WARN_ON(viortc_feed_vq(viortc, vq, notif, VIORTC_ALARMQ_BUF_CAP,
> +			       token));
> +
> +	notify = virtqueue_kick_prepare(vq);
> +
> +	spin_unlock_irqrestore(&viortc_vq->lock, flags);
> +
> +	if (notify)
> +		virtqueue_notify(vq);
> +}
> +
> +/**
> + * viortc_cb_alarmq() - callback for alarmq
> + * @vq: virtqueue
> + *
> + * Context: virtqueue callback
> + */
> +static void viortc_cb_alarmq(struct virtqueue *vq)
> +{
> +	viortc_do_cb(vq, viortc_alarmq_hdlr);
> +}
> +
>  /**
>   * viortc_get_resp_errno() - converts virtio_rtc errnos to system errnos
>   * @resp_head: message response header
> @@ -638,10 +778,192 @@ int viortc_cross_cap(struct viortc_dev *viortc, u16 vio_clk_id, u8 hw_counter,
>  	return ret;
>  }
>  
> +/**
> + * viortc_read_alarm() - VIRTIO_RTC_REQ_READ_ALARM wrapper
> + * @viortc: device data
> + * @vio_clk_id: virtio_rtc clock id
> + * @alarm_time: alarm time in ns
> + * @enabled: whether alarm is enabled
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +int viortc_read_alarm(struct viortc_dev *viortc, u16 vio_clk_id,
> +		      u64 *alarm_time, bool *enabled)
> +{
> +	VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, VIRTIO_RTC_REQ_READ_ALARM,
> +				       struct virtio_rtc_req_read_alarm,
> +				       struct virtio_rtc_resp_read_alarm);
> +	u8 flags;
> +	int ret;
> +
> +	ret = VIORTC_MSG_INIT(hdl, viortc);
> +	if (ret)
> +		return ret;
> +
> +	VIORTC_MSG_WRITE(hdl, clock_id, &vio_clk_id);
> +
> +	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
> +			      0);
> +	if (ret) {
> +		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
> +			ret);
> +		goto out_release;
> +	}
> +
> +	VIORTC_MSG_READ(hdl, alarm_time, alarm_time);
> +	VIORTC_MSG_READ(hdl, flags, &flags);
> +
> +	*enabled = !!(flags & VIRTIO_RTC_FLAG_ALARM_ENABLED);
> +
> +out_release:
> +	viortc_msg_release(VIORTC_MSG(hdl));
> +
> +	return ret;
> +}
> +
> +/**
> + * viortc_set_alarm() - VIRTIO_RTC_REQ_SET_ALARM wrapper
> + * @viortc: device data
> + * @vio_clk_id: virtio_rtc clock id
> + * @alarm_time: alarm time in ns
> + * @alarm_enable: enable or disable alarm
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +int viortc_set_alarm(struct viortc_dev *viortc, u16 vio_clk_id, u64 alarm_time,
> +		     bool alarm_enable)
> +{
> +	VIORTC_DECLARE_MSG_HDL_ONSTACK(hdl, VIRTIO_RTC_REQ_SET_ALARM,
> +				       struct virtio_rtc_req_set_alarm,
> +				       struct virtio_rtc_resp_set_alarm);
> +	u8 flags = 0;
> +	int ret;
> +
> +	ret = VIORTC_MSG_INIT(hdl, viortc);
> +	if (ret)
> +		return ret;
> +
> +	if (alarm_enable)
> +		flags |= VIRTIO_RTC_FLAG_ALARM_ENABLED;
> +
> +	VIORTC_MSG_WRITE(hdl, clock_id, &vio_clk_id);
> +	VIORTC_MSG_WRITE(hdl, alarm_time, &alarm_time);
> +	VIORTC_MSG_WRITE(hdl, flags, &flags);
> +
> +	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
> +			      0);
> +	if (ret) {
> +		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
> +			ret);
> +		goto out_release;
> +	}
> +
> +out_release:
> +	viortc_msg_release(VIORTC_MSG(hdl));
> +
> +	return ret;
> +}
> +
> +/**
> + * viortc_set_alarm_enabled() - VIRTIO_RTC_REQ_SET_ALARM_ENABLED wrapper
> + * @viortc: device data
> + * @vio_clk_id: virtio_rtc clock id
> + * @alarm_enable: enable or disable alarm
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +int viortc_set_alarm_enabled(struct viortc_dev *viortc, u16 vio_clk_id,
> +			     bool alarm_enable)
> +{
> +	VIORTC_DECLARE_MSG_HDL_ONSTACK(
> +		hdl, VIRTIO_RTC_REQ_SET_ALARM_ENABLED,
> +		struct virtio_rtc_req_set_alarm_enabled,
> +		struct virtio_rtc_resp_set_alarm_enabled);
> +	u8 flags = 0;
> +	int ret;
> +
> +	ret = VIORTC_MSG_INIT(hdl, viortc);
> +	if (ret)
> +		return ret;
> +
> +	if (alarm_enable)
> +		flags |= VIRTIO_RTC_FLAG_ALARM_ENABLED;
> +
> +	VIORTC_MSG_WRITE(hdl, clock_id, &vio_clk_id);
> +	VIORTC_MSG_WRITE(hdl, flags, &flags);
> +
> +	ret = viortc_msg_xfer(&viortc->vqs[VIORTC_REQUESTQ], VIORTC_MSG(hdl),
> +			      0);
> +	if (ret) {
> +		dev_dbg(&viortc->vdev->dev, "%s: xfer returned %d\n", __func__,
> +			ret);
> +		goto out_release;
> +	}
> +
> +out_release:
> +	viortc_msg_release(VIORTC_MSG(hdl));
> +
> +	return ret;
> +}
> +
>  /*
>   * init, deinit
>   */
>  
> +/**
> + * viortc_init_rtc_class_clock() - init and register a RTC class device
> + * @viortc: device data
> + * @vio_clk_id: virtio_rtc clock id
> + * @clock_type: virtio_rtc clock type
> + * @flags: struct virtio_rtc_resp_clock_cap.flags
> + *
> + * The clock must be a UTC-like clock.
> + *
> + * Context: Process context.
> + * Return: Positive if registered, zero if not supported by configuration,
> + *         negative error code otherwise.
> + */
> +static int viortc_init_rtc_class_clock(struct viortc_dev *viortc,
> +				       u16 vio_clk_id, u8 clock_type, u8 flags)
> +{
> +	struct virtio_device *vdev = viortc->vdev;
> +	struct viortc_class *viortc_class;
> +	struct device *dev = &vdev->dev;
> +	bool have_alarm;
> +
> +	if (clock_type != VIRTIO_RTC_CLOCK_UTC_SMEARED) {
> +		dev_info(
> +			dev,
> +			"not creating RTC class device for clock %d, which may step on leap seconds\n",
> +			vio_clk_id);
> +		return 0;
> +	}
> +
> +	if (viortc->viortc_class) {
> +		dev_warn_once(
> +			dev,
> +			"multiple UTC-like clocks are present, but creating only one RTC class device\n");
> +		return 0;
> +	}
> +
> +	have_alarm = viortc_alarms_supported(vdev) &&
> +		     !!(flags & VIRTIO_RTC_FLAG_ALARM_CAP);
> +
> +	viortc_class = viortc_class_init(viortc, vio_clk_id, have_alarm, dev);
> +	if (IS_ERR(viortc_class))
> +		return PTR_ERR(viortc_class);
> +
> +	viortc->viortc_class = viortc_class;
> +
> +	if (have_alarm)
> +		device_init_wakeup(dev, true);
> +
> +	return viortc_class_register(viortc_class) ?: 1;
> +}
> +
>  /**
>   * viortc_init_ptp_clock() - init and register PTP clock
>   * @viortc: device data
> @@ -697,6 +1019,18 @@ static int viortc_init_clock(struct viortc_dev *viortc, u16 vio_clk_id)
>  	if (ret)
>  		return ret;
>  
> +	if (IS_ENABLED(CONFIG_VIRTIO_RTC_CLASS) &&
> +	    (clock_type == VIRTIO_RTC_CLOCK_UTC ||
> +	     clock_type == VIRTIO_RTC_CLOCK_UTC_SMEARED ||
> +	     clock_type == VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED)) {
> +		ret = viortc_init_rtc_class_clock(viortc, vio_clk_id,
> +						  clock_type, flags);
> +		if (ret < 0)
> +			return ret;
> +		if (ret > 0)
> +			is_exposed = true;
> +	}
> +
>  	if (IS_ENABLED(CONFIG_VIRTIO_RTC_PTP)) {
>  		ret = viortc_init_ptp_clock(viortc, vio_clk_id, clock_type,
>  					    leap_second_smearing);
> @@ -716,7 +1050,7 @@ static int viortc_init_clock(struct viortc_dev *viortc, u16 vio_clk_id)
>  }
>  
>  /**
> - * viortc_clocks_exit() - unregister PHCs
> + * viortc_clocks_exit() - unregister PHCs, stop RTC ops
>   * @viortc: device data
>   */
>  static void viortc_clocks_exit(struct viortc_dev *viortc)
> @@ -734,6 +1068,9 @@ static void viortc_clocks_exit(struct viortc_dev *viortc)
>  
>  		WARN_ON(viortc_ptp_unregister(vio_ptp, &viortc->vdev->dev));
>  	}
> +
> +	if (viortc->viortc_class)
> +		viortc_class_stop(viortc->viortc_class);
>  }
>  
>  /**
> @@ -780,6 +1117,74 @@ static int viortc_clocks_init(struct viortc_dev *viortc)
>  	return ret;
>  }
>  
> +/**
> + * viortc_populate_vq() - populate alarmq with device-writable buffers
> + * @viortc: device data
> + * @vq: virtqueue
> + * @buf_cap: device-writable buffer size in bytes
> + *
> + * Populates the alarmq with pre-allocated buffers.
> + *
> + * The caller is responsible for kicking the device.
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +static int viortc_populate_vq(struct viortc_dev *viortc, struct virtqueue *vq,
> +			      u32 buf_cap)
> +{
> +	unsigned int num_elems, i;
> +	void *buf;
> +	int ret;
> +
> +	num_elems = viortc->num_alarmq_bufs;
> +
> +	for (i = 0; i < num_elems; i++) {
> +		buf = viortc->alarmq_bufs[i];
> +
> +		ret = viortc_feed_vq(viortc, vq, buf, buf_cap, buf);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * viortc_alloc_vq_bufs() - allocate alarmq buffers
> + * @viortc: device data
> + * @num_elems: # of buffers
> + * @buf_cap: per-buffer device-writable bytes
> + *
> + * Context: Process context.
> + * Return: Zero on success, negative error code otherwise.
> + */
> +static int viortc_alloc_vq_bufs(struct viortc_dev *viortc,
> +				unsigned int num_elems, u32 buf_cap)
> +{
> +	struct device *dev = &viortc->vdev->dev;
> +	void **buf_list;
> +	unsigned int i;
> +	void *buf;
> +
> +	buf_list = devm_kcalloc(dev, num_elems, sizeof(*buf_list), GFP_KERNEL);
> +	if (!buf_list)
> +		return -ENOMEM;
> +
> +	viortc->alarmq_bufs = buf_list;
> +	viortc->num_alarmq_bufs = num_elems;
> +
> +	for (i = 0; i < num_elems; i++) {
> +		buf = devm_kzalloc(dev, buf_cap, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +
> +		buf_list[i] = buf;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * viortc_init_vqs() - init virtqueues
>   * @viortc: device data
> @@ -795,11 +1200,19 @@ static int viortc_init_vqs(struct viortc_dev *viortc)
>  	struct virtio_device *vdev = viortc->vdev;
>  	struct virtqueue_info vqs_info[] = {
>  		{ "requestq", viortc_cb_requestq },
> +		{ "alarmq", viortc_cb_alarmq },
>  	};
>  	struct virtqueue *vqs[VIORTC_MAX_NR_QUEUES];
> +	unsigned int num_elems;
> +	bool have_alarms;
>  	int nr_queues;
>  
> -	nr_queues = VIORTC_REQUESTQ + 1;
> +	have_alarms = viortc_alarms_supported(vdev);
> +
> +	if (have_alarms)
> +		nr_queues = VIORTC_ALARMQ + 1;
> +	else
> +		nr_queues = VIORTC_REQUESTQ + 1;
>  
>  	ret = virtio_find_vqs(vdev, nr_queues, vqs, vqs_info, NULL);
>  	if (ret)
> @@ -808,6 +1221,25 @@ static int viortc_init_vqs(struct viortc_dev *viortc)
>  	viortc->vqs[VIORTC_REQUESTQ].vq = vqs[VIORTC_REQUESTQ];
>  	spin_lock_init(&viortc->vqs[VIORTC_REQUESTQ].lock);
>  
> +	if (have_alarms) {
> +		viortc->vqs[VIORTC_ALARMQ].vq = vqs[VIORTC_ALARMQ];
> +		spin_lock_init(&viortc->vqs[VIORTC_ALARMQ].lock);
> +
> +		num_elems = virtqueue_get_vring_size(vqs[VIORTC_ALARMQ]);
> +		if (num_elems == 0)
> +			return -ENOSPC;
> +
> +		if (!viortc->alarmq_bufs) {
> +			ret = viortc_alloc_vq_bufs(viortc, num_elems,
> +						   VIORTC_ALARMQ_BUF_CAP);
> +			if (ret)
> +				return ret;
> +		} else {
> +			viortc->num_alarmq_bufs =
> +				min(num_elems, viortc->num_alarmq_bufs);
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -820,6 +1252,7 @@ static int viortc_init_vqs(struct viortc_dev *viortc)
>   */
>  static int viortc_probe(struct virtio_device *vdev)
>  {
> +	struct virtqueue *alarm_vq;
>  	struct viortc_dev *viortc;
>  	int ret;
>  
> @@ -840,6 +1273,20 @@ static int viortc_probe(struct virtio_device *vdev)
>  	if (ret)
>  		goto err_reset_vdev;
>  
> +	if (viortc_alarms_supported(vdev)) {
> +		alarm_vq = viortc->vqs[VIORTC_ALARMQ].vq;
> +
> +		ret = viortc_populate_vq(viortc, alarm_vq,
> +					 VIORTC_ALARMQ_BUF_CAP);
> +		if (ret)
> +			goto err_reset_vdev;
> +
> +		if (!virtqueue_kick(alarm_vq)) {
> +			ret = -EIO;
> +			goto err_reset_vdev;
> +		}
> +	}
> +
>  	return 0;
>  
>  err_reset_vdev:
> @@ -863,6 +1310,33 @@ static void viortc_remove(struct virtio_device *vdev)
>  	vdev->config->del_vqs(vdev);
>  }
>  
> +static int viortc_freeze(struct virtio_device *dev)
> +{
> +	return 0;
> +}
> +
> +static int viortc_restore(struct virtio_device *dev)
> +{
> +	struct viortc_dev *viortc = dev->priv;
> +	int ret;
> +
> +	ret = viortc_init_vqs(viortc);
> +	if (ret)
> +		return ret;
> +
> +	if (viortc_alarms_supported(dev))
> +		ret = viortc_populate_vq(viortc, viortc->vqs[VIORTC_ALARMQ].vq,
> +					 VIORTC_ALARMQ_BUF_CAP);
> +
> +	return ret;
> +}
> +
> +static unsigned int features[] = {
> +#if IS_ENABLED(CONFIG_VIRTIO_RTC_CLASS)
> +	VIRTIO_RTC_F_ALARM,
> +#endif
> +};
> +
>  static struct virtio_device_id id_table[] = {
>  	{ VIRTIO_ID_CLOCK, VIRTIO_DEV_ANY_ID },
>  	{ 0 },
> @@ -871,9 +1345,13 @@ MODULE_DEVICE_TABLE(virtio, id_table);
>  
>  static struct virtio_driver virtio_rtc_drv = {
>  	.driver.name = KBUILD_MODNAME,
> +	.feature_table = features,
> +	.feature_table_size = ARRAY_SIZE(features),
>  	.id_table = id_table,
>  	.probe = viortc_probe,
>  	.remove = viortc_remove,
> +	.freeze = pm_sleep_ptr(viortc_freeze),
> +	.restore = pm_sleep_ptr(viortc_restore),
>  };
>  
>  module_virtio_driver(virtio_rtc_drv);
> diff --git a/drivers/virtio/virtio_rtc_internal.h b/drivers/virtio/virtio_rtc_internal.h
> index 785356e488a8..e7f865259afd 100644
> --- a/drivers/virtio/virtio_rtc_internal.h
> +++ b/drivers/virtio/virtio_rtc_internal.h
> @@ -9,6 +9,8 @@
>  #ifndef _VIRTIO_RTC_INTERNAL_H_
>  #define _VIRTIO_RTC_INTERNAL_H_
>  
> +#include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/types.h>
>  #include <linux/ptp_clock_kernel.h>
>  
> @@ -21,6 +23,16 @@ int viortc_read_cross(struct viortc_dev *viortc, u16 vio_clk_id, u8 hw_counter,
>  		      u64 *reading, u64 *cycles);
>  int viortc_cross_cap(struct viortc_dev *viortc, u16 vio_clk_id, u8 hw_counter,
>  		     bool *supported);
> +int viortc_read_alarm(struct viortc_dev *viortc, u16 vio_clk_id,
> +		      u64 *alarm_time, bool *enabled);
> +int viortc_set_alarm(struct viortc_dev *viortc, u16 vio_clk_id, u64 alarm_time,
> +		     bool alarm_enable);
> +int viortc_set_alarm_enabled(struct viortc_dev *viortc, u16 vio_clk_id,
> +			     bool alarm_enable);
> +
> +struct viortc_class;
> +
> +struct viortc_class *viortc_class_from_dev(struct device *dev);
>  
>  /* PTP IFs */
>  
> @@ -67,4 +79,44 @@ static inline int viortc_ptp_unregister(struct viortc_ptp_clock *vio_ptp,
>   */
>  int viortc_hw_xtstamp_params(u8 *hw_counter, enum clocksource_ids *cs_id);
>  
> +/* RTC class IFs */
> +
> +#if IS_ENABLED(CONFIG_VIRTIO_RTC_CLASS)
> +
> +void viortc_class_alarm(struct viortc_class *viortc_class, u16 vio_clk_id);
> +
> +void viortc_class_stop(struct viortc_class *viortc_class);
> +
> +int viortc_class_register(struct viortc_class *viortc_class);
> +
> +struct viortc_class *viortc_class_init(struct viortc_dev *viortc,
> +				       u16 vio_clk_id, bool have_alarm,
> +				       struct device *parent_dev);
> +
> +#else /* CONFIG_VIRTIO_RTC_CLASS */
> +
> +static inline void viortc_class_alarm(struct viortc_class *viortc_class,
> +				      u16 vio_clk_id)
> +{
> +}
> +
> +static inline void viortc_class_stop(struct viortc_class *viortc_class)
> +{
> +}
> +
> +static inline int viortc_class_register(struct viortc_class *viortc_class)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline struct viortc_class *viortc_class_init(struct viortc_dev *viortc,
> +						     u16 vio_clk_id,
> +						     bool have_alarm,
> +						     struct device *parent_dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +#endif /* CONFIG_VIRTIO_RTC_CLASS */
> +
>  #endif /* _VIRTIO_RTC_INTERNAL_H_ */
> diff --git a/include/uapi/linux/virtio_rtc.h b/include/uapi/linux/virtio_rtc.h
> index 8fb04846b397..f19895b36dd3 100644
> --- a/include/uapi/linux/virtio_rtc.h
> +++ b/include/uapi/linux/virtio_rtc.h
> @@ -9,6 +9,9 @@
>  
>  #include <linux/types.h>
>  
> +/* alarm feature */
> +#define VIRTIO_RTC_F_ALARM	0
> +
>  /* read request message types */
>  
>  #define VIRTIO_RTC_REQ_READ			0x0001
> @@ -19,6 +22,13 @@
>  #define VIRTIO_RTC_REQ_CFG			0x1000
>  #define VIRTIO_RTC_REQ_CLOCK_CAP		0x1001
>  #define VIRTIO_RTC_REQ_CROSS_CAP		0x1002
> +#define VIRTIO_RTC_REQ_READ_ALARM		0x1003
> +#define VIRTIO_RTC_REQ_SET_ALARM		0x1004
> +#define VIRTIO_RTC_REQ_SET_ALARM_ENABLED	0x1005
> +
> +/* alarmq message types */
> +
> +#define VIRTIO_RTC_NOTIF_ALARM			0x2000
>  
>  /* Message headers */
>  
> @@ -39,6 +49,12 @@ struct virtio_rtc_resp_head {
>  	__u8 reserved[7];
>  };
>  
> +/** common notification header */
> +struct virtio_rtc_notif_head {
> +	__le16 msg_type;
> +	__u8 reserved[6];
> +};
> +
>  /* read requests */
>  
>  /* VIRTIO_RTC_REQ_READ message */
> @@ -160,6 +176,7 @@ struct virtio_rtc_resp_clock_cap {
>  #define VIRTIO_RTC_FLAG_LEAP_CAP		(1 << 0)
>  #define VIRTIO_RTC_FLAG_TAI_OFFSET_CAP		(1 << 1)
>  #define VIRTIO_RTC_FLAG_SMEAR_OFFSET_CAP	(1 << 2)
> +#define VIRTIO_RTC_FLAG_ALARM_CAP		(1 << 3)
>  	__u8 flags;
>  	__u8 reserved[5];
>  };
> @@ -180,6 +197,53 @@ struct virtio_rtc_resp_cross_cap {
>  	__u8 reserved[7];
>  };
>  
> +/* VIRTIO_RTC_REQ_READ_ALARM message */
> +
> +struct virtio_rtc_req_read_alarm {
> +	struct virtio_rtc_req_head head;
> +	__le16 clock_id;
> +	__u8 reserved[6];
> +};
> +
> +struct virtio_rtc_resp_read_alarm {
> +	struct virtio_rtc_resp_head head;
> +	__le64 alarm_time;
> +#define VIRTIO_RTC_FLAG_ALARM_ENABLED	(1 << 0)
> +	__u8 flags;
> +	__u8 reserved[7];
> +};
> +
> +/* VIRTIO_RTC_REQ_SET_ALARM message */
> +
> +struct virtio_rtc_req_set_alarm {
> +	struct virtio_rtc_req_head head;
> +	__le64 alarm_time;
> +	__le16 clock_id;
> +	/* flag VIRTIO_RTC_ALARM_ENABLED */
> +	__u8 flags;
> +	__u8 reserved[5];
> +};
> +
> +struct virtio_rtc_resp_set_alarm {
> +	struct virtio_rtc_resp_head head;
> +	/* no response params */
> +};
> +
> +/* VIRTIO_RTC_REQ_SET_ALARM_ENABLED message */
> +
> +struct virtio_rtc_req_set_alarm_enabled {
> +	struct virtio_rtc_req_head head;
> +	__le16 clock_id;
> +	/* flag VIRTIO_RTC_ALARM_ENABLED */
> +	__u8 flags;
> +	__u8 reserved[5];
> +};
> +
> +struct virtio_rtc_resp_set_alarm_enabled {
> +	struct virtio_rtc_resp_head head;
> +	/* no response params */
> +};
> +
>  /** Union of request types for requestq */
>  union virtio_rtc_req_requestq {
>  	struct virtio_rtc_req_read read;
> @@ -187,6 +251,9 @@ union virtio_rtc_req_requestq {
>  	struct virtio_rtc_req_cfg cfg;
>  	struct virtio_rtc_req_clock_cap clock_cap;
>  	struct virtio_rtc_req_cross_cap cross_cap;
> +	struct virtio_rtc_req_read_alarm read_alarm;
> +	struct virtio_rtc_req_set_alarm set_alarm;
> +	struct virtio_rtc_req_set_alarm_enabled set_alarm_enabled;
>  };
>  
>  /** Union of response types for requestq */
> @@ -196,6 +263,24 @@ union virtio_rtc_resp_requestq {
>  	struct virtio_rtc_resp_cfg cfg;
>  	struct virtio_rtc_resp_clock_cap clock_cap;
>  	struct virtio_rtc_resp_cross_cap cross_cap;
> +	struct virtio_rtc_resp_read_alarm read_alarm;
> +	struct virtio_rtc_resp_set_alarm set_alarm;
> +	struct virtio_rtc_resp_set_alarm_enabled set_alarm_enabled;
> +};
> +
> +/* alarmq notifications */
> +
> +/* VIRTIO_RTC_NOTIF_ALARM notification */
> +
> +struct virtio_rtc_notif_alarm {
> +	struct virtio_rtc_notif_head head;
> +	__le16 clock_id;
> +	__u8 reserved[6];
> +};
> +
> +/** Union of notification types for alarmq */
> +union virtio_rtc_notif_alarmq {
> +	struct virtio_rtc_notif_alarm alarm;
>  };
>  
>  #endif /* _LINUX_VIRTIO_RTC_H */
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

