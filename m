Return-Path: <linux-rtc+bounces-1354-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FE90D7F6
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 18:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDB07B2FB34
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 15:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE9923777;
	Tue, 18 Jun 2024 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bVmvQHsu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE8223749;
	Tue, 18 Jun 2024 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723879; cv=none; b=IpFmTzUP8JT3TvU4S6iMWI2S5+8RA4PBQMsVtTr4jcxjibs8jygm1sSBBByTBJ+iFfPuSzsgMpP4/RQjD7k6Jtwvb3S/vh+ijxKmygWcz6WmkZmtTS+YA62fPpDRbZrHa56B2dwicizLFJw+HH1iZdt4D5zQCxoG3+iC3es37JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723879; c=relaxed/simple;
	bh=TSyddSQwddStofTU8ovraNU+a6CE76ymidBr5E0QYzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqsZg2n5Yj+HRhscpTtYsL2+R6x1nfPzsaBskc895ujhw8+RYqNrcUFILyapIThZNk8gDTcZB2vmBSMBWSvmClIhDyoHwViV7FwKzqhkSsmEJ4iI6OV+9IToPkgQFWb6m0n6z7gCZ1yN1QO2HEn+za0glYVb7RjwCsBTUBN1fKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bVmvQHsu; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EA9C240006;
	Tue, 18 Jun 2024 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718723870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbgnawqPU9vT8GnZ5Li1z5KdrSOCwdjOzlBrIYH0Ric=;
	b=bVmvQHsuT8SSN2WzjlHpmIoAeD0zMa+YqUM1MT4WHJyQKDe5XvqoH1bV3ksoFgo7IORTwe
	lIn1Ee5thWVkg67Y92kmNbdDzZiIpxE981uoNLALizqJRH8JCbnVat6kvgjmXbmGTUfgMb
	SguTATDlW9fC1FNzV2s/S9c9+0EC/sNCxcOCOB0w5VMZCgYQc3w/UDKpzw4zitJo316+i6
	vtQW2P3jiQ6lgUr2LfyFBkWkSpANBUXSi4Dg+ehyDlK9/puzycU25fPwf+GQihvXWZStD2
	8YUafN91e/TkVThumXunTa27bL1ln4tyHO4taFvA99iw8ZQmADyrYOGCJUz/xw==
Date: Tue, 18 Jun 2024 17:17:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Esteban Blanc <eblanc@baylibre.com>, linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] rtc: tps6594: Add power management support
Message-ID: <20240618151749d6ed0733@mail.local>
References: <20240515152827.80185-1-richard.genoud@bootlin.com>
 <20240515152827.80185-2-richard.genoud@bootlin.com>
 <09168a9a-d8a3-43a9-b8cc-fd88cff9db82@bootlin.com>
 <c4ce3a14-fb28-4c34-abc1-9b0ae1c1a82f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4ce3a14-fb28-4c34-abc1-9b0ae1c1a82f@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 18/06/2024 11:48:33+0200, Richard GENOUD wrote:
> Le 14/06/2024 à 15:21, Thomas Richard a écrit :
> > > diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
> > > index 3f7c5e23cd4c..85933f1519c4 100644
> > > --- a/include/linux/mfd/tps6594.h
> > > +++ b/include/linux/mfd/tps6594.h
> > > @@ -1011,6 +1011,7 @@ struct tps6594 {
> > >   	bool use_crc;
> > >   	struct regmap *regmap;
> > >   	int irq;
> > > +	int irq_rtc;
> > 
> > irq_rtc should be stored in driver data.
> I understand your point.
> It may indeed be cleaner to separate the rtc-specific data into a private
> struct.
> 
> I'll send a v3 with this modification, and I'll let Alexandre decide which
> he prefers.

My plan is to take v2 as-is


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

