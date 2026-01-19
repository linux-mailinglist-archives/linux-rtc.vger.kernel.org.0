Return-Path: <linux-rtc+bounces-5789-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 087DCD3AC81
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 15:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88572314BF71
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 14:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D4222A4E9;
	Mon, 19 Jan 2026 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lyvzfcyz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE819CCF5;
	Mon, 19 Jan 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833148; cv=none; b=q0HrUoqN9ouxoqVoYOW65/vLB8k61lTn6Jppi8oEiB2o7tDGSeQkDKUROjRsFfWQ1KADQBjQgTwgjuKss8qGz+6GIkOruKWBUTWPVc0ClU89tWo7nc8G0iEP7du1rR9kg32RCN5XCX0gXpl8Eob28xKdHEY72FZMDwQWRomslVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833148; c=relaxed/simple;
	bh=DOVGe1NIyTR0/0dJGE7gRKbBILCMt6ySmCJQGd1tO7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=qEKJ4vXS84Xingw9FYAcu9DcCoa3dlDi72u9BDxXAa5XYtFSNMgZCDNnZiKKWLuIcC4/mYS+G5eAKqlPkVN4uI4p+jg9GUZdUeVHYCJfkOHmoamqrGZU6tJqPNRLK9Qmgs4dWIIXoiQrDuilMRctnInz4/KeBynHGNKC9qLKDk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lyvzfcyz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8551C116C6;
	Mon, 19 Jan 2026 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768833147;
	bh=DOVGe1NIyTR0/0dJGE7gRKbBILCMt6ySmCJQGd1tO7A=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Lyvzfcyz1I5rDltncgzWvv9V49TYZyFu9IyhmlmcaubfejPtgrDbcTgyGbO5nV4q6
	 aPWO/PYH/yNJHBjKIc8d85a38+d/+RCmtknvf50aR993jQA5p5mPdJl7knCUod0KyO
	 8+nJcgJ5+PippDOaT3YDjMgGYysR4JqWA7cGvGm6ZaJUQM2CXJkX1OQqQ5OEjGWTBQ
	 3vEK8E4QeLWeEpEO/vqJyDZcjPCbYKxzb+J+KQ4VzDSBaQzjneVIU1+p5/zmrWra7S
	 cIunUp1DJty7AM4aahamhM70SwtD7G6a3WlsTIFbgqMYqrJ4qisdUmbu6Mq22P9aVQ
	 UsdhwP08mm+xA==
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 15:32:23 +0100
Message-Id: <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
To: "Ke Sun" <sunke@kylinos.cn>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-rtc@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alvin Sun" <sk.alvin.x@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
In-Reply-To: <20260116162203.296844-2-sunke@kylinos.cn>

On Fri Jan 16, 2026 at 5:21 PM CET, Ke Sun wrote:
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index baf1a8ca8b2b1..eddcc5a69db3b 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>  		}
>  		default:
>  			if (rtc->ops->param_get)
> -				err =3D rtc->ops->param_get(rtc->dev.parent, &param);
> +				err =3D rtc->ops->param_get(rtc_ops_dev(rtc), &param);
>  			else
>  				err =3D -EINVAL;
>  		}

<snip>

> +/**
> + * rtc_ops_dev - Get the device pointer for RTC ops callbacks
> + * @rtc: RTC device
> + *
> + * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
> + * otherwise returns rtc->dev.parent.
> + */
> +static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
> +{
> +	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
> +		return &rtc->dev;
> +	return rtc->dev.parent;
> +}

I understand that the idea is to gradually convert all drivers to use the R=
TC
device, rather than it's parent device in RTC device callbacks.

My main concern is that once that has been achieved it's still not what we =
want
to have eventually, i.e. RTC device callbacks should ideally take a struct
rtc_device as argument and not the embedded base struct device.

I.e. we'd kick off a conversion process that won't reach the actual desired
state.

