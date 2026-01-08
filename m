Return-Path: <linux-rtc+bounces-5705-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E42AD03FD3
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 16:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0C6C30E446E
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 15:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F3E81724;
	Thu,  8 Jan 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFhhw6t0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D104D77C6;
	Thu,  8 Jan 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881211; cv=none; b=Mbn4tJ9k5icGeD0SYCVCUH9l7RxZ0BDxG8c6DdaMzziC9F1yeLP76wUBdqsnOEimj0bkvsJrinkf170gbKqC2s4kUkmTNOpSDdcC2zceIT1SDElJr+Y8Dx36jqTlaBIQEH5lehb3PMVKr6kQ2xTIaaWKr3NdOh4Wz3d0fnDvgLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881211; c=relaxed/simple;
	bh=8Fj+jMvl5Qep2ruZOm2X+2K93FiFxbkY2nCx7B0QOZw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Klsrz0E9l2JrFvsVuCIESxDljd906aHkvca4UeENaN5nGecG8kG3HQV9A6hdn4z2C7OhC1FIXgI+NnmDqJcisdQoO/2oaeIRFHkVjMdNuATlp0mVKg15uSnqGyHM1cjIiWi+EFoVUMDcz64f5lPhI4ETFesmQeNs/nZ1XKSmNWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFhhw6t0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF0BC116C6;
	Thu,  8 Jan 2026 14:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767881210;
	bh=8Fj+jMvl5Qep2ruZOm2X+2K93FiFxbkY2nCx7B0QOZw=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=PFhhw6t0DiUZOBWfzAg+zPPt8OdNBDSTTTOUsganHGBSJB5I2CJNlUPIGfM/Y5CCv
	 vU7/NJnuq9oNHWotAgCQWJKDcfMpLOIWRm0QIxWK6HiopNDpQdG/Va49Gvjax7wskv
	 HwjpG4kcYxhOLeqXe02Y1saulwRYhRkjCJrIG8ujzYI/NVQgYccjXBVhmi+ntARuWx
	 Q4ZXMnbWTt6H/YdbN0yDOYbrCfqTCEH7kMe0F+OLqajP+ZazDjQSnO4pYd0BUE7uKR
	 usouP7d356jiBXRQR3C7M5K9NniHDElrzdr441Wnnfl6QPdRgOV7b617i4aORK3dJk
	 FzkGFMchVhwmA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 15:06:46 +0100
Message-Id: <DFJ9L2GPU6WT.1RYEWZJ1V75DE@kernel.org>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Cc: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-rtc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Alvin Sun"
 <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org> <202601081401239bbfff9d@mail.local>
In-Reply-To: <202601081401239bbfff9d@mail.local>

On Thu Jan 8, 2026 at 3:01 PM CET, Alexandre Belloni wrote:
> On 08/01/2026 14:52:08+0100, Danilo Krummrich wrote:
>> On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
>> >
>> > On 1/8/26 19:12, Danilo Krummrich wrote:
>> >> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
>> >>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>> >>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>> >>> --- a/drivers/rtc/dev.c
>> >>> +++ b/drivers/rtc/dev.c
>> >>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>> >>>   		}
>> >>>   		default:
>> >>>   			if (rtc->ops->param_get)
>> >>> -				err =3D rtc->ops->param_get(rtc->dev.parent, &param);
>> >>> +				err =3D rtc->ops->param_get(&rtc->dev, &param);
>> >> It would make more sense to just pass a struct rtc_device than the em=
bedded
>> >> struct device in the RTC callbacks.
>> > I considered passing struct rtc_device directly, but chose &rtc->dev
>> > to minimize changes to existing drivers, since most callbacks use
>> > dev_get_drvdata() on the device parameter.
>>=20
>> No, you should not expose the embedded base device. For accessing the pr=
ivate
>> data you should add helpers like rtc_get_drvdata(). This is what other
>> subsystems do as well, e.g. [1].
>>=20
>> [1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#=
L371
>
> This is not a correct example as i2c is a bus, just like amba is...

Yes, struct i2c_client is indeed a bus device. However, the core struct dev=
ice
is what holds the device private data commonly in the same way, regardless =
of
whether it is embedded in a bus or class device.

If you look for a class device example, here's PWM [2] and input [3].

[2] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/pwm.h#L38=
2
[3] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/input.h#L=
388

> Actually, I don't think the rework is necessary at all or this would
> mean we need to rewor most of our existing subsystems.

That's not true, subsystems do not pass the parent device (i.e. the bus dev=
ice)
through their class device callbacks exclusively.

- Danilo

