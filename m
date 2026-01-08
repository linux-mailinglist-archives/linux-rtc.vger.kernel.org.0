Return-Path: <linux-rtc+bounces-5687-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F039AD027D9
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 12:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 206B530C248D
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 11:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C611835770A;
	Thu,  8 Jan 2026 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmOnKS3p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A22356A1F;
	Thu,  8 Jan 2026 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870759; cv=none; b=cc7ZtcRaceuihTh0ZEfp+gwLG4vl4Tuz2hJjxuSpdVbhT0A3iEE3f9Wd8V5EpOfTA5onH7K6hNuw3gosb9S3ciPXZwfJEriEzH7dqPHyfVjr62ccBJtw9i+Ko6ct2FrAv1bIb1XokxYyiWh81VAftOE1HuhPiP2ZeTL0aeEU6qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870759; c=relaxed/simple;
	bh=zPcz3Wxha4WiUbFKr0OpVdCEF8Cq+SSruRDx9IDttW4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ARqS24nybScHsnhGx7tmH/DwT1857SprbfkP0aKcqfEUOlfoaOZgDOIt7jaBxEjXHEczdlHIWoNJFaG/vyWFLIuX4yqIwjFdZzabvykEdepu2bO858DDdhCW2Jd2vyhgCV3BTgVf40ygEcVvrDNG3XInpcvZ9kztTHPhWdmjI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmOnKS3p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D0EC116C6;
	Thu,  8 Jan 2026 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767870758;
	bh=zPcz3Wxha4WiUbFKr0OpVdCEF8Cq+SSruRDx9IDttW4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=AmOnKS3pEm8aLT5IoFXe9t4kAkjH/q7C0Xkq6/pvgW+5Vk1V8FZFCVZUW6MRxZerh
	 wZ8L9xByCfA3+UlcpBZhNV/1Z8RINw89AOfhNJZEu+vOxB62ebG28VoE0/hN56NFTg
	 Gx2A7EjTKqse+JRmALkqo8knt3T7eTSw+HEZkQIuWXXo/MS+D14XtzW+5PH71M5QOi
	 aOc7tD7QTqSIQ+brUlY+iF225K6BID4YBZ6QGZmMvl2OC7oyizDrqG0bvkKsmWSVQp
	 HJKg+lyl4n4Fc9ZmtpnyqfAxKvrpJBDqI8DFaDV5AVpdCR916lsrXj7nvQRMHukqbu
	 7NHMJo2Fj7gng==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 12:12:34 +0100
Message-Id: <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alvin Sun" <sk.alvin.x@gmail.com>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
In-Reply-To: <20260107143738.3021892-2-sunke@kylinos.cn>

On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index baf1a8ca8b2b1..0f62ba9342e3e 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>  		}
>  		default:
>  			if (rtc->ops->param_get)
> -				err =3D rtc->ops->param_get(rtc->dev.parent, &param);
> +				err =3D rtc->ops->param_get(&rtc->dev, &param);

It would make more sense to just pass a struct rtc_device than the embedded
struct device in the RTC callbacks.

> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, cons=
t struct amba_id *id)
>  		goto out;
> =20
>  	if (adev->irq[0]) {
> -		ret =3D request_irq(adev->irq[0], pl031_interrupt,
> +		ret =3D devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>  				  vendor->irqflags, "rtc-pl031", ldata);

As Greg already mentioned that change should be a separate patch.

You also have to be careful with the devres order when using devm_request_i=
rq().

In your case, you pass ldata, so you have to ensure that ldata (and its
contents) remain valid until the devres callback frees the IRQ request.

