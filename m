Return-Path: <linux-rtc+bounces-5990-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFiUDvHrmGkKOQMAu9opvQ
	(envelope-from <linux-rtc+bounces-5990-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 00:19:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A92B516B5E8
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 00:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99858300E275
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Feb 2026 23:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB1E30B514;
	Fri, 20 Feb 2026 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TrYQGlCM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A72FD68B
	for <linux-rtc@vger.kernel.org>; Fri, 20 Feb 2026 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771629549; cv=none; b=FtMYRq2uYDGywAHSnc2lT2BgUgOcupnLOIG/eVebkreF5V7M9t1YRsfl3SNiijVKVXgckYMA6nQZLPBJLpL204+m6W+SJ4l1nqofBzg2q1fO0XMnvtgIud+2pzAXCvY8iBWFtC2KDn/LgHTEfw1oV8gXXnnnN4z0BwAHe6C3bfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771629549; c=relaxed/simple;
	bh=hc8hZJyBrwJzLSuJKvh0KWFluL8Bn4U3y6DvyycR1HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUluGwlfi4CGAEBRvxUvWH0Ad9Y/FTC2rFujHttl+GlWgqjhrNuSSFJ/L+BTuZ5ha+UWXpgxerpCR68+DSa5sR0B89CkuwFdzkpdzaEioHw0PyKZQmh/B4QeIUoNtEj3bD0qwpE0MbR3tnDNVFkgLXP8bD4O0tYA9kVFwECFlkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TrYQGlCM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6CB054E409FC;
	Fri, 20 Feb 2026 23:19:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9C755FB4D;
	Fri, 20 Feb 2026 23:19:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74B1310368D13;
	Sat, 21 Feb 2026 00:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771629544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=lNfGJ0ay+5Wos3qum1EcSSRUNaughEj5aaV5FT0UreM=;
	b=TrYQGlCMk2R6CgupxqUkqB5fGBkfXsJCkR67/RioBiRWFmaXjiwUbYCw8wT/nMIZFukXTj
	1aIKlNOV821PJ0kM6tZWxJ5KSlRYEP99xKibOI+IJw60PJv5xny/XiYcs+8XBUGVQNaL1h
	qBk/blwuuSoXhttbAjIbT2XpnIHPtAM3llRcSre95k15K0OxZTx3aXmsp/gpRbdJZvdQve
	YITg6ea1OqJRs6sfsneEu5+ze+nieMrnW0DZ0TaFB/Z61X0OoIhXGcBzXGtJFKp+S4azpc
	NtDrA3UUnKNshhtt+U5JiWCXxAzY9DLIvibJdLKh5XsJ2W3rIFhppe7UulQlIQ==
Date: Sat, 21 Feb 2026 00:19:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Alvin Sun <sk.alvin.x@gmail.com>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Message-ID: <20260220231900694f36a0@mail.local>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
 <202601081401239bbfff9d@mail.local>
 <DFJ9L2GPU6WT.1RYEWZJ1V75DE@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFJ9L2GPU6WT.1RYEWZJ1V75DE@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5990-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kylinos.cn,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A92B516B5E8
X-Rspamd-Action: no action

On 08/01/2026 15:06:46+0100, Danilo Krummrich wrote:
> On Thu Jan 8, 2026 at 3:01 PM CET, Alexandre Belloni wrote:
> > On 08/01/2026 14:52:08+0100, Danilo Krummrich wrote:
> >> On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
> >> >
> >> > On 1/8/26 19:12, Danilo Krummrich wrote:
> >> >> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
> >> >>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> >> >>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
> >> >>> --- a/drivers/rtc/dev.c
> >> >>> +++ b/drivers/rtc/dev.c
> >> >>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
> >> >>>   		}
> >> >>>   		default:
> >> >>>   			if (rtc->ops->param_get)
> >> >>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> >> >>> +				err = rtc->ops->param_get(&rtc->dev, &param);
> >> >> It would make more sense to just pass a struct rtc_device than the embedded
> >> >> struct device in the RTC callbacks.
> >> > I considered passing struct rtc_device directly, but chose &rtc->dev
> >> > to minimize changes to existing drivers, since most callbacks use
> >> > dev_get_drvdata() on the device parameter.
> >> 
> >> No, you should not expose the embedded base device. For accessing the private
> >> data you should add helpers like rtc_get_drvdata(). This is what other
> >> subsystems do as well, e.g. [1].
> >> 
> >> [1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#L371
> >
> > This is not a correct example as i2c is a bus, just like amba is...
> 
> Yes, struct i2c_client is indeed a bus device. However, the core struct device
> is what holds the device private data commonly in the same way, regardless of
> whether it is embedded in a bus or class device.
> 
> If you look for a class device example, here's PWM [2] and input [3].
> 
> [2] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/pwm.h#L382
> [3] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/input.h#L388
> 
> > Actually, I don't think the rework is necessary at all or this would
> > mean we need to rewor most of our existing subsystems.
> 
> That's not true, subsystems do not pass the parent device (i.e. the bus device)
> through their class device callbacks exclusively.

Like explained on the other thread, while it would be conceptually
better to pass a struct rtc_device to the callbacks, it doesn't solve
your issue. Let me take a random input drivers as an example:

https://elixir.bootlin.com/linux/v6.18.3/source/drivers/input/keyboard/pinephone-keyboard.c#L373
This sets its own private data on the parent device, it needs it later
on in the interrupt handler

https://elixir.bootlin.com/linux/v6.18.3/source/drivers/input/joystick/as5011.c#L313
It needs it later on in the remove callback

https://elixir.bootlin.com/linux/v6.18.3/source/drivers/input/misc/da7280.c#L1197
Needed later on for suspend/resume

So the input subsystem is not different from RTC

For PWM:

https://elixir.bootlin.com/linux/v6.18.6/source/drivers/pwm/pwm-pca9685.c#L450
Needed for suspend/resume and .remove()

https://elixir.bootlin.com/linux/v6.18.6/source/drivers/pwm/pwm-rockchip.c#L348
Needed for .remove()

Any other subsystem is going to have similar examples. I don't think
there is a pressing need to rewrite the rtc_class_ops callbacks.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

