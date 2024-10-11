Return-Path: <linux-rtc+bounces-2167-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241499A3E7
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 14:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BDF41C21BD9
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 12:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1C81E529;
	Fri, 11 Oct 2024 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gpaSJKb8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2601CDFA6;
	Fri, 11 Oct 2024 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728649847; cv=none; b=fXEvhCo3FP+5L6tKYZtX1Yze4Vn0k6/O51pCDvc76Xyrg1jid9dToVD0KDVMNek972yh790RkzmxvurDNIrVh2NdkgCWrApDBoO3LDgarnzdqpC5it0iMe9jJ0CPABr/7hzwigOc/YmzWqhM/iNcpV7J2NclMa1X3pKRpaCyYHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728649847; c=relaxed/simple;
	bh=BCH7PrI7kWkYVvVSX9yuqqs3O368jlJef4ZOOrS5xpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qd/IITOtIqrYioCvcAgnTtpcTKDLIrSTIMVleJKAxYYcSMtQM1wtjYgsv6vIndtdAYmGf7Ctd7Ly8GL5O9eCpVgJV13l279xC92kF0jihAkhov4oYbv5VWQK82eDWoMHzmJgOmhn5z7s+ATjWXzKXF4JpsSMJu/ImkTvzCG98Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gpaSJKb8; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D952240004;
	Fri, 11 Oct 2024 12:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728649837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtZ43o+n0lVYAHb7FodlWRBQacNR2hb0Jj0IyVbDSRI=;
	b=gpaSJKb8oyaRWUDBCGB+RyGTfZEQyMphrjaflD4rUhTC1S/h6JtbxX64/Dj9Vruf5fl6Gz
	EkVohJZoIIm7KvQ/iWiBL+rq2nE6BuTD7h8mHikrWckUipfXlZB/TMkXUZucrkCbsDpU1v
	8FXXeCbihBXXs4fXFdGUeVQsXzEg2xGIsFM+DsSX2w92hB9er4E2sdbos0i0g/jAgKZvgW
	6EtdXo380X1eTCtg8areLJ+Kc5ZICbRsk+5IVoiV6/NmvZW95TatQS2j/O/+Ah829MlfJe
	rshg0w17OmQxDzDW8honJ9XnMm3U8Qs8TDTQISop87Ti6XuRnSWVLtryn1EB3g==
Date: Fri, 11 Oct 2024 14:30:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor.Dooley@microchip.com
Cc: conor@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Daire.McNamara@microchip.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: mpfs-rtc: remove Lewis from maintainers
Message-ID: <202410111230367324262a@mail.local>
References: <20241011-boozy-blinking-f76d3891dacd@wendy>
 <c565f64b-9d5b-4dee-945d-44be9762282e@microchip.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c565f64b-9d5b-4dee-945d-44be9762282e@microchip.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 11/10/2024 11:00:40+0000, Conor.Dooley@microchip.com wrote:
> On 11/10/2024 11:39, Conor Dooley wrote:
> > Lewis hasn't worked at Microchip for a while, and IIRC never actually
> > worked on the RTC in the first place. Remove him from the maintainers
> > list in the binding, leaving Daire.
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Noticed him in the CC list of your rename, figured it was worth removing
> > him, even though I don't /think/ our mail system will create bounce spam
> > in this case.
> 

I never received this patch and lore seems to agree with me:

https://lore.kernel.org/all/c565f64b-9d5b-4dee-945d-44be9762282e@microchip.com/

[parent not found: <20241011-boozy-blinking-f76d3891dacd@wendy>]

Can you resend?

> I was wrong, it does generate bounce spam :/
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

