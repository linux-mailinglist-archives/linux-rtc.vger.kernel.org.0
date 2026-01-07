Return-Path: <linux-rtc+bounces-5674-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A631CCFF4AD
	for <lists+linux-rtc@lfdr.de>; Wed, 07 Jan 2026 19:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD02534D729D
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jan 2026 16:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD960318B87;
	Wed,  7 Jan 2026 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v59mAY+F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D5318EDB;
	Wed,  7 Jan 2026 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802345; cv=none; b=g6ATx51wJeMBP9Hy+1qTsXaV6ZbJnouoaHCcIV1L+y0+jpGTQMmyw16kLKXDUh53Go+L14syWBFWm+vgdGTK472CoojaZsApDS8S3QcPDW6CHytUL9aHxnfgNFlvs2DcXdNcfUFo+Hy94nHiSvPodZurW59UcpQmrLnFreSjw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802345; c=relaxed/simple;
	bh=aTyUr+aLeUhdKOatcQ9dwhCwrXMqLPH5zbcHr5OAc2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDxFg4ChwPU+A47/dYk34Fzllkh1TJDYmvNhEspaoT/KrIkMhd2+2XPoVr7zURJ9Gb0wAOsx5ooDsadhGu7ehAywW7dCAmsVDCdsLiN8Pd827Xun09g2oAb/4rSeYAfFdM8h5ljnD9qNA5Ta9a7aMD6xmBqrhmSYavERz3wjixE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v59mAY+F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0CAC4CEF1;
	Wed,  7 Jan 2026 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767802343;
	bh=aTyUr+aLeUhdKOatcQ9dwhCwrXMqLPH5zbcHr5OAc2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v59mAY+FXkP9eAkCNLKT0VjmLTFdSgTLnJqR8wxAOTXKihT3jq7gxoe0oXbUT9lih
	 O7emFYUNDVqsghy2xqll/uvToJHNOPlll5sWdWgFLPl3GneX2QcuI8NYJwKyzOuaoU
	 x4uLkaM2y/gm9FrvsMkQ1b1ErJA+KhPKGTZVz/BE=
Date: Wed, 7 Jan 2026 17:12:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-rtc@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Message-ID: <2026010757-fester-unissued-6e5f@gregkh>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107143738.3021892-2-sunke@kylinos.cn>

On Wed, Jan 07, 2026 at 10:37:33PM +0800, Ke Sun wrote:
> Unify RTC driver interface by storing driver data on the RTC device
> instead of the parent device. Update RTC ops callbacks to pass the RTC
> device itself rather than its parent. This change enables better
> support for Rust RTC drivers that store data on the RTC device.
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  drivers/rtc/dev.c       |  4 ++--
>  drivers/rtc/interface.c | 18 +++++++++---------
>  drivers/rtc/rtc-pl031.c |  9 ++-------
>  3 files changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index baf1a8ca8b2b1..0f62ba9342e3e 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>  		}
>  		default:
>  			if (rtc->ops->param_get)
> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> +				err = rtc->ops->param_get(&rtc->dev, &param);
>  			else
>  				err = -EINVAL;
>  		}
> @@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
>  
>  		default:
>  			if (rtc->ops->param_set)
> -				err = rtc->ops->param_set(rtc->dev.parent, &param);
> +				err = rtc->ops->param_set(&rtc->dev, &param);
>  			else
>  				err = -EINVAL;
>  		}
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index b8b298efd9a9c..783a3ec3bb93d 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
>  		err = -EINVAL;
>  	} else {
>  		memset(tm, 0, sizeof(struct rtc_time));
> -		err = rtc->ops->read_time(rtc->dev.parent, tm);
> +		err = rtc->ops->read_time(&rtc->dev, tm);
>  		if (err < 0) {
>  			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
>  				err);
> @@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>  	if (!rtc->ops)
>  		err = -ENODEV;
>  	else if (rtc->ops->set_time)
> -		err = rtc->ops->set_time(rtc->dev.parent, tm);
> +		err = rtc->ops->set_time(&rtc->dev, tm);
>  	else
>  		err = -EINVAL;
>  
> @@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
>  		alarm->time.tm_wday = -1;
>  		alarm->time.tm_yday = -1;
>  		alarm->time.tm_isdst = -1;
> -		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
> +		err = rtc->ops->read_alarm(&rtc->dev, alarm);
>  	}
>  
>  	mutex_unlock(&rtc->ops_lock);
> @@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>  	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
>  		err = -EINVAL;
>  	else
> -		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
> +		err = rtc->ops->set_alarm(&rtc->dev, alarm);
>  
>  	/*
>  	 * Check for potential race described above. If the waiting for next
> @@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>  	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>  		err = -EINVAL;
>  	else
> -		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
> +		err = rtc->ops->alarm_irq_enable(&rtc->dev, enabled);
>  
>  	mutex_unlock(&rtc->ops_lock);
>  
> @@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>  		rtc->uie_rtctimer.period = ktime_set(1, 0);
>  		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
>  		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
> -			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
> +			err = rtc->ops->alarm_irq_enable(&rtc->dev, 1);
>  		if (err)
>  			goto out;
>  	} else {
> @@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
>  	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>  		return;
>  
> -	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
> +	rtc->ops->alarm_irq_enable(&rtc->dev, false);
>  	trace_rtc_alarm_irq_enable(0, 0);
>  }
>  
> @@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
>  		return -EINVAL;
>  
>  	mutex_lock(&rtc->ops_lock);
> -	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
> +	ret = rtc->ops->read_offset(&rtc->dev, offset);
>  	mutex_unlock(&rtc->ops_lock);
>  
>  	trace_rtc_read_offset(*offset, ret);
> @@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
>  		return -EINVAL;
>  
>  	mutex_lock(&rtc->ops_lock);
> -	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
> +	ret = rtc->ops->set_offset(&rtc->dev, offset);
>  	mutex_unlock(&rtc->ops_lock);
>  
>  	trace_rtc_set_offset(offset, ret);
> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
> index eab39dfa4e5fe..a605034d44cb7 100644
> --- a/drivers/rtc/rtc-pl031.c
> +++ b/drivers/rtc/rtc-pl031.c
> @@ -284,10 +284,6 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>  
>  static void pl031_remove(struct amba_device *adev)
>  {
> -	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
> -
> -	if (adev->irq[0])
> -		free_irq(adev->irq[0], ldata);
>  	amba_release_regions(adev);
>  }
>  
> @@ -320,8 +316,6 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>  		goto out;
>  	}
>  
> -	amba_set_drvdata(adev, ldata);
> -
>  	dev_dbg(&adev->dev, "designer ID = 0x%02x\n", amba_manf(adev));
>  	dev_dbg(&adev->dev, "revision = 0x%01x\n", amba_rev(adev));
>  
> @@ -356,6 +350,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>  		ret = PTR_ERR(ldata->rtc);
>  		goto out;
>  	}
> +	dev_set_drvdata(&ldata->rtc->dev, ldata);
>  
>  	if (!adev->irq[0])
>  		clear_bit(RTC_FEATURE_ALARM, ldata->rtc->features);
> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>  		goto out;
>  
>  	if (adev->irq[0]) {
> -		ret = request_irq(adev->irq[0], pl031_interrupt,
> +		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>  				  vendor->irqflags, "rtc-pl031", ldata);

Are you _SURE_ you can use devm for this?  it is a functional change,
one that trips lots of people up.  I wouldn't make this change without
at least saying why you are doing so in the changelog text, which I
didn't see at all here.

thanks,

greg k-h

