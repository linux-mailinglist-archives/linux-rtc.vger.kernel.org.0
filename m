Return-Path: <linux-rtc+bounces-1389-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35004914499
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 10:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666BE1C21F32
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2024 08:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771F04D5A0;
	Mon, 24 Jun 2024 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lN8T9qOT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B526A34CDD
	for <linux-rtc@vger.kernel.org>; Mon, 24 Jun 2024 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719217391; cv=none; b=dWI+OMA71LhD5yYDbhOxqv5pPvX9Z7XIhC0GY3iQ9v7Msb5Ti20IDn6DYQQboWHuRGNzPtFzKppeCGWH0S3MpKyM0K3I4uy0x2V5MZph8/hGZ/Gmt+z6ThHissuddGb0oeXYm7TYl510qD09kCvXUMYA8h2xXLVejRaKdvJ2fFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719217391; c=relaxed/simple;
	bh=xztZNNOFZeAKkwVC9DwbDPLZVO2KlXD/H0tJ/rdBoyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUkhEF09ZAQfV1HSsaXre6pj0qCEYXORqXnl7m4S+584DUtisKivBIJMeiP6/ceIpFtgUuJpkjO0btlTLeCvb6wY4Lv+k7zpwvP9++jOboAc2AjHdDNDWXLSoGfjDEIcZbQZ+beBtTlvTVHyHg9Q+lH8FGVg/hCVNAoddJ4mgOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lN8T9qOT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cd628f21cso2969784e87.3
        for <linux-rtc@vger.kernel.org>; Mon, 24 Jun 2024 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719217387; x=1719822187; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAbf9sm2FPbblhOCoQR1lRZu/jTXhdQPY5Q8OvwCdsA=;
        b=lN8T9qOTBv0y/sWwpamKcEoSi19CeR85kXiZQiMNdjyFHBEw5PY+dpr+dfEwall+8A
         4C2gIU8VGJc3F/62halHGZXxWhpFiIjIRTU7EgaBmx2WQIJ0q77yPyargdx8AmiU7kSM
         wJMEvWoS2wzLI88PN4Y+BsVkvfTKFJK+L1ZAukIeKaLqYFsC6RzyB89/+mh6BGZ0d23z
         q50FrbDyCN1DPXyxcaMMK6IPcHfHeGTczN1NZ22h4p9GAEohQ/SWz56Fkx3mMTdCEWIU
         pWSF0z3E7/Xr4Eg09CZdWco/PFyQRiZDJH7lLf/oGpAURvqb/VkO1X7TwlLm5QhsRGCG
         IxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217387; x=1719822187;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAbf9sm2FPbblhOCoQR1lRZu/jTXhdQPY5Q8OvwCdsA=;
        b=QAdeuURCSOsG2tvoXFEqnKtK81gltx1yrnpXltNl8izDY0ZRELUMoe4/wj5o+CpvcS
         8PdGERH6l+f+8RFGY8CAdWr+AvzG9nL8PtMYFIjWATx0A+F1gPVDxv/fnSf02YGKDVWF
         PmZsespkPxTc4nJtaxH4x/gv6Rz20FXIHhbyyomVNvaRxbHOvD0zLGuTahmjCwHlfyZJ
         a2lAfnwW6yPE3eLdLASIiQ37v0JULnEqTiFI4JviqZG2jZgHwCEKQfXuk6OSV2r4QjBf
         P9NrKyQkkQL2MJ5dnG5k8garhPmEL0vqB5MahZjd3HqIgXMjejOifEJ3sQIgPQqWACgd
         nZOQ==
X-Gm-Message-State: AOJu0YwgGReN4+0/PR60AidS2JWeVgS3sQTvHQ+3oJIovFohB/+IUr19
	dw7iZSErtkhA/IfkMmstn+o4Or1dT4KkJYWdkeFwpgg6rM3YfRg0a6Lr3AHq1gw=
X-Google-Smtp-Source: AGHT+IEyt3bSQYHsWilSUI7BBCuTrMgK0C3fJwYNcbtPSPK9EC0LZfbKmqyv4m1Zf/SoqBy8EvdkIQ==
X-Received: by 2002:ac2:47e8:0:b0:52c:86de:cb61 with SMTP id 2adb3069b0e04-52ce1832c4fmr2370715e87.10.1719217386878;
        Mon, 24 Jun 2024 01:23:06 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0beb08sm173454105e9.17.2024.06.24.01.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:23:06 -0700 (PDT)
Date: Mon, 24 Jun 2024 10:23:06 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: csokas.bence@prolan.hu, alexandre.belloni@bootlin.com
Subject: Re: [PATCH v3] drivers: rtc: Add driver for SD2405AL.
Message-ID: <f3qyvklwkk54qztburaa5x6xqb4ijk4phrtzadys2ndghbrulw@aeuhbtkfn3bh>
Reply-To: linux-rtc@vger.kernel.org
References: <20240620-rtc-sd2405al-v3-1-65d5bb01af50@gmail.com>
 <21ca87a0-6062-411d-88e4-c644c054e497@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21ca87a0-6062-411d-88e4-c644c054e497@prolan.hu>

Hi!

Thank you four your review!

> > +static int sd2405al_setup(struct sd2405al *sd2405al)
> > +{
> > +	unsigned int val;
> > +	int ret;
> 
> I would still remove `val` and inline everything.

Okay, I'll do that.

> > +static int sd2405al_check_state(struct sd2405al *sd2405al)
> > +{
> > +	u8 data[2] = { 0 };
> > +	int state;
> > +	int ret;
> > +
> > +	ret = regmap_bulk_read(sd2405al->regmap, SD2405AL_REG_CTR1, data, 2);
> > +	if (ret < 0) {
> > +		dev_err(sd2405al->dev, "read failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* CRT1 */
> > +	state = (data[0] & (SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3)) != 0;
> > +
> > +	/* CTR2 */
> > +	state &= (data[1] & SD2405AL_BIT_WRTC1) != 0;
> > +
> > +	return state;
> 
> Same here.

I'll give it a try and see how it would look.

> > +static int sd2405al_read_time(struct device *dev, struct rtc_time *time)
> > +{
> > +	u8 hour;
> 
> This variable could also be inlined.

Sure, I'll inline it.

János


