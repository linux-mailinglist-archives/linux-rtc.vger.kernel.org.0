Return-Path: <linux-rtc+bounces-4167-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EDAC6703
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 12:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1B2D162B6D
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 10:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C1A27A446;
	Wed, 28 May 2025 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wL4Vlu2J"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F927991E
	for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428391; cv=none; b=tpEuXOJOJKIT5TXft20vi/Dx4mBek+73ePVPD4cIu/tG8ZdKfj0IapNZ0Yt1HqMd0vmxNdgCz1B75kOVp+QXMPPpsxsHNfWgn10mlEs8+8K1Qnty2FUA9znrLaVX3prET8zZflkHg0smOcTmsuKkitYxNioJzaEgASIV3pFRd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428391; c=relaxed/simple;
	bh=k3gpEJcg0kYry2W0tqCCHTbk//8aSpTV6Apt8u04Q+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuQ2YxkGEtC5emnT+xhj3e1MFIO0mI8x+/BBrPagwB1BqDtwHXj9skgKVhBDVHeS4iptg6C718IaK3r+NwkaD5Lnnot2O4rm0q2mxw3D/6Gt8kaTuDo4I2OKdLdLOfDs4nNytTNEu1UIyxKDhWCbGFpSJ2KkkkVXUJJHkjDmW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wL4Vlu2J; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4dd5f69e7so1945609f8f.0
        for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748428387; x=1749033187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3gpEJcg0kYry2W0tqCCHTbk//8aSpTV6Apt8u04Q+M=;
        b=wL4Vlu2JVrupEUnF5guft90dYBsfUNuccqT//3q5q1Lpkqkk0k3mBdeR8JyapwOg9R
         weNxwll1844iXzXeJgo9stX5vsfCG8XllJ6AQk1AInGo6vygHU7svh8vcVSX2CF3hoqz
         yEAm2QCxbpNXNXkcVATz+IYP7/LgpaarKTnQ40f44TOYnJNj24Ba34ugjedP2R8yulpn
         vFukBoRBJ8fIQgTu78AogYtpqsa/Rxnr+Vjb5SSe5KgrWWwZNfGG7QvNAQaGHjd5WvIs
         +8oFxTD6dt6O2J/IMaDlJUc63A6OeKjhZe3Ya3CZabRzR90Dc3tpGx3nYADFMTovW2oC
         qxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428387; x=1749033187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3gpEJcg0kYry2W0tqCCHTbk//8aSpTV6Apt8u04Q+M=;
        b=rFXZdGsVZGhpPYKrycFj9N1jttTdflKkU7f0io9H+4FQ9OqSPTEAsTHuOHiYihWgiB
         wah9pEowPpAdpDVVdWuCtODTefzg88/bVM6B3c0MYppbCaw43etK8B1KBP7GZ4AP3P9+
         dVTN7UJ96oVyT3q2MR8+inRjMkqDkswVKc39EODq8hbxATjMSz1k6Nsk80i9IHVjyTtf
         o1iEYEnFV9XnxmqyDa6AOjWql4QEPyxZCZR12Wc1TANwc7s2z9JaAcjzCmw/qr5Dm92U
         f47uDn7/CNED8ZCo0eZsNGtV9MEE7ZHAJSKl28v8E97P7Tohn5O6+UDoL53J6eUE/NFy
         lecg==
X-Forwarded-Encrypted: i=1; AJvYcCXR6txAPhXvSqyqsIfIr6V6nvmR3K8MKEn5SNbpbm8UdiGsK0MHcZK/e1PEn1g69jVsXnsXtdlcW/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/K9h3zPRkRlywy8M206npHx8nE04ZozU+pVeg12CpovqR9gsp
	8EIF3YLXQEyb6svrrydGD17RLVjrP4Y504TgJFaXEk6bTMVMSb2RIo/H3+ZTvuEBdj1hFu+y5K6
	i2j7x
X-Gm-Gg: ASbGncvOLpYDcsPxQ5fLoQu4ReOMdtEohQDoWC1G3EvhpmuPvYj27I0nlt0JuToundC
	Ka9JNOktUCKe6+kL0myxEBuEeinT2giQzGAKfd9WJFtPM7GTpYMTlxPkSA2e40W6it5wFh4wJMa
	/a8/5WAbnHAAoPaTZBIbVOTe55hCN5rPGtJZoUNe3cZJ5Tzwc0UIUwY/dO5gAwd5XKxjf32R9Ee
	y9YrKoHfeFTLVvx0Thfr+AAuEwyxXipRuvTclrbMYbo/xc/IvMwGvmgQj8hV3SiLQXP3UjnnOMX
	xl+MDbxzSRG3TBxwM1ZttXVdrdK2WZmMqF7VBGVLoymh1klxn/h0cn5qf1g1aDIcR8q9kkcnqz/
	9uFAhlKXu98H9QWbiOg==
X-Google-Smtp-Source: AGHT+IFKnjxzu4eBQmsvCPg1xaKU/IIhLdWicIu7kaut12YixanQTz8B9WBJEx1lmJ7Uy4Pqov78Rg==
X-Received: by 2002:a05:6000:430b:b0:3a4:ebf6:49cc with SMTP id ffacd0b85a97d-3a4ebf64b1emr1076486f8f.52.1748428387150;
        Wed, 28 May 2025 03:33:07 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450064a1bdbsm17144885e9.14.2025.05.28.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:33:06 -0700 (PDT)
Date: Wed, 28 May 2025 12:33:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
Message-ID: <oedecrcylyiorqnbymuk65cjgqbvh6gr2wox753ff7hj3qbaw3@blb3sgh7qia6>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
 <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>
 <5gpvxwgqfgvb6eu6nwso3xk4xpdqayz7wo6y2mvweci2veetqw@wsurri5h7xvu>
 <yjymcsje4z5c2htgefya2cocyx5guvepng756vdigjmvxvk6dv@wqyeh33mfty4>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ru76mgvkjhofjrqh"
Content-Disposition: inline
In-Reply-To: <yjymcsje4z5c2htgefya2cocyx5guvepng756vdigjmvxvk6dv@wqyeh33mfty4>


--ru76mgvkjhofjrqh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
MIME-Version: 1.0

Hello Alexandre,

On Tue, May 06, 2025 at 09:58:32AM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 28, 2025 at 06:59:33PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Apr 28, 2025 at 12:06:47PM +0200, Alexandre Mergnat wrote:
> > > Conversion of dates before 1970 is still relevant today because these
> > > dates are reused on some hardwares to store dates bigger than the
> > > maximal date that is representable in the device's native format.
> > > This prominently and very soon affects the hardware covered by the
> > > rtc-mt6397 driver that can only natively store dates in the interval
> > > 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> > > to such a device, rtc_time64_to_tm() must do the right thing for
> > > time=3D-2208988800.
> > >=20
> > > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >=20
> > Given this problem starts to bite in 2028 I'd like to see this (and the
> > next) patch backported to stable. If you want a Fixes: line, maybe
> > 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for
> > start-year") is sensible here as this is the commit that introduced the
> > requirement to handle negative timestamps. (The drivers that made use
> > of the offset feature already before that commit all had
> > .range_min >=3D 0, and so are not affected by this problem.)
>=20
> Given that we're already at v6.15-rc5 I wonder if there is a chance to
> get these changes reviewed and applied before v6.15. Would a pull
> request help you? If yes, should it only contain the fixes, or also the
> updated tests?

We missed to get the patches in for v6.15 :-\

I see you recently applied some patches in your rtc-next branch, but
this series isn't included. That makes me wonder if you still have it on
your radar.

My offer to provide you a pull request still stands, just tell me if I
should include the tests if you want me to provide such a PR.

Best regards
Uwe

--ru76mgvkjhofjrqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg25l4ACgkQj4D7WH0S
/k65MQf/WSzUcpB1XhqT0a0RlN0FfyIlADZVVqI+WuuiDznaDCOfGuaq7w5tljRN
LfW6en3fTwRpLyGM7G7aAMhElqIoSw/wL8OkS8IW6B28+ASu7FDxeuKcTBj44P4S
Nxd4lPW1r06ce5L7F7SUTdGOPRNORkbx0/XXRM5UKuyMV9W9ycNHYS/gp3zKeJey
NXQiIO+LPxRecRYjY6aDvaCQPLDSkEh8NrGMamG6Za9EOUN5vWnQ/1KuZ5jy3kcB
yDC+VnQpQj2yx3286OrbULJbO5fShzCowDj8eXQXkzyF0tFNjzhRBr8MGNZdoSTz
QxD0B1uTCIfcN0deT/xqWcfKnQ72Mw==
=M+MM
-----END PGP SIGNATURE-----

--ru76mgvkjhofjrqh--

