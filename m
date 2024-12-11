Return-Path: <linux-rtc+bounces-2708-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EFB9ECC11
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 13:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FB422815A4
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2024 12:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0BC225A56;
	Wed, 11 Dec 2024 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ekav7q+u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B3F2210EE
	for <linux-rtc@vger.kernel.org>; Wed, 11 Dec 2024 12:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920174; cv=none; b=BMApSIqiD+SGJb8I+HNQae0esxRewraucYyLPHoYCaaNTl8yWFzYHdlsZ34eVjnLQQ9tABSfKtvGhj/HlW2L6dPgmeGYOAgNqs2s/xHxDv67SZI/7cgzrG/bbC53yaAENdObrkMmzXuQGAocPtl9GffhK1M3t2gwfi+XItxrXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920174; c=relaxed/simple;
	bh=YEw/IRYYRv/+z+aIG9Q+90G+HCvcHBe1Et0PZYVkGhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAELGyt3+j/MZ2+PY2SgXZIzd34yHD8T+PZYSKV7Lu0ldFDc4XdFTappRWalm02mtaFWu3SV9ciQLfjch78ssoM4G9FZVW7IaxtnGkZzsUFaLvbe1EItWuMa4MRFHFxAcel35QwuacdBuUcDz1E0bRG8cZDEEw444XU6JLdWBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ekav7q+u; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a2033562so57680565e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 11 Dec 2024 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733920171; x=1734524971; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4q1I1Yh84bKu8NCVCn6hfhSIWeIgmZ50vGMDpFsxBHQ=;
        b=Ekav7q+ufLl3fuWLREiCJGSstwg9iN8bF+06/HnGxcpTnMBpy9xC0dBe0vDwyJ50bi
         dfuPuscO4nO2AOynyAp3BKRJHhcKGtTCBPPvKDqEWPbMGp0NxpfXxWHZXsC/nDHckkIa
         APyp35geaWmbms2cJB/UKitcdDzHkhwr+jaEWO/sct6ZRUdhqspqEv15sEenALsvJcEG
         xkYvG6qaivMMZmH20EVyojtAf2CA9AK3Vv2xhnVDFR/ZweJMjt4/2mRFb4RqJ2laEqIn
         hzjjFUoRoKa1PAVNqtate1hO9jf9Xcbeg/RSpfqFdHCmvfh2Z8GY7U5ghhKyIWENz3AQ
         JjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920171; x=1734524971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4q1I1Yh84bKu8NCVCn6hfhSIWeIgmZ50vGMDpFsxBHQ=;
        b=p5oWVSx32AAnY5Rxyct7Oi53kDA2LqnTca9beLWabSZ2t0L5TvAnJDpsrMiYpAT3Qu
         tIj7e8eUu71WGA61LhKc0BS1czgVdimWcu413/BxxP+5HJ0Xmf2DjGuK72dlbRUKYmO/
         tWzF5BMMCm//aSPA3nX8MgccDGVColB3IBJaQVEhvL74yoT78cdAxI4byzq6HEHbuNdz
         d2X0zHH1jNWYqQZFxMcTlcTnI14wO721+22WnFojbsbcaMwTRmC/D24oMrsJP5NDd6ju
         s72OGDbu0gE4FlXRqUVUcqNbCMsG19ZcDz7MX/I8bD1N0EtxUBsRP6b/duGqB3w9rVHj
         FaeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsBs4p7OMxNbHf3CJIUFQKPE5rwTjGi/Sz7nFIpLKfOUxJAuoNL+gjOPNuwBOlbnpBeMi2ye+SsT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5YsEe37NePg0gZleIQUSHgbsCNUdPxZqCwkAS8j5kEEW0r6N
	abxFnsyy5Rt0hFptX6M2d+n8zO20FCJ0w28rXXQ3wigEz0oFF4L7KXXIGoXCOPI=
X-Gm-Gg: ASbGnctv71jhElkV9QNEtBtE8I9ylUO69uP+1XV6e5AlL14gmkxAWW2z3NRw6mWaf8b
	hZo+DbWS/flNDR7AZwDUr4I5COgXW139XhzbLjkxR4P67ju8sk/MF1NiGaYjPrW2murhhyvgSPL
	aQ3DnxpZwnpvUi0A4a9DWoqcvQbfpPaicFCos50jz17ZqKG8MH3ry2/Ulm9PfnLwgzl4ZvHHGYv
	oGpI+WW4pioWYxUSxinWSrqIxOxvomgDWXf+kiCFzA+y6my3Mj5krR8R34=
X-Google-Smtp-Source: AGHT+IE0TgsU6/73zikWtGl+XcC9OJmbSxFiscCQo7i68052biLcQRUNTqXnT2vH4aEJK/3SFna9UA==
X-Received: by 2002:a5d:64e6:0:b0:386:424e:32d5 with SMTP id ffacd0b85a97d-3864ce556f4mr2228673f8f.14.1733920171168;
        Wed, 11 Dec 2024 04:29:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361d541eccsm20564675e9.10.2024.12.11.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 04:29:30 -0800 (PST)
Date: Wed, 11 Dec 2024 15:29:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Esteban Blanc <eblanc@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: tps6594: Fix integer overflow on 32bit systems
Message-ID: <e434930a-f30d-427f-9cc6-41562a31d8dc@stanley.mountain>
References: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
 <CAHp75VfssNnd9zvNu+N9xc74RO+qBPC_qhF5ed_G8p5HJ8LWvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfssNnd9zvNu+N9xc74RO+qBPC_qhF5ed_G8p5HJ8LWvw@mail.gmail.com>

On Wed, Dec 11, 2024 at 01:51:31PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 11, 2024 at 11:32 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The problem is this multiply in tps6594_rtc_set_offset()
> >
> >         tmp = offset * TICKS_PER_HOUR;
> >
> > The "tmp" variable is an s64 but "offset" is a long in the
> > (-277774)-277774 range.  On 32bit systems a long can hold numbers up to
> > approximately two billion.  The number of TICKS_PER_HOUR is really large,
> > (32768 * 3600) or roughly a hundred million.  When you start multiplying
> > by a hundred million it doesn't take long to overflow the two billion
> > mark.
> >
> > Probably the safest way to fix this is to change the type of
> > TICKS_PER_HOUR to long long because it's such a large number.
> 
> ...
> 
> > -#define TICKS_PER_HOUR (32768 * 3600)
> > +#define TICKS_PER_HOUR (32768 * 3600LL)
> 
> Hmm... And why signed?

It needs to be signed for negatives.  That's deliberate.

regards,
dan carpenter

