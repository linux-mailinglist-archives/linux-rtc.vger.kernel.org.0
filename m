Return-Path: <linux-rtc+bounces-2615-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C48BC9D6897
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2024 11:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56805B210AB
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2024 10:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8CC18732B;
	Sat, 23 Nov 2024 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZJG1nAoP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880917084F;
	Sat, 23 Nov 2024 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732357563; cv=none; b=WRTraXkwPC+2cP1ZVKUdkBhAuCvhAib8TDFZ+HshF9kq7uw5tOYtLi8gMNoGl96qYKe3yKUdR9/pmSHlZ1dLJoe2GjJdB7CSglB9DCp/c7kFJGcY0D/AxKHvmG/TueH7f7QGH9MhzJBdHMQqubLazxBmVlokXNvuRs6pPDtTMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732357563; c=relaxed/simple;
	bh=veqmojNYsoHdDjpwSmUB+h0P8uZLslhY92ThFJR0wrM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwXYx2Hs7sLa+mMIS9+yeUnfcAG3wn5fZd0vMmswJRCRoXqPlUpC0WEdcLcqFEpjRF68NBtgy+o8tkk+mdqDCMby1xrw21DsUjQV1TJizvLdpPTTJ3fORtSoNGjyrTlSL9cTjo9o3iOeVvH922tzG898rzrKQAeut5gWpCTgvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZJG1nAoP; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 650EF240002;
	Sat, 23 Nov 2024 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732357558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YBQrsRmDQe6npyJt6DqZeccvKWKbZ0zr0uOYPZuTnRk=;
	b=ZJG1nAoPWJjadBK7BD7w2EwNfMyAElTMzuX555T45o9fja37u7aINllLHq8AhhjXK6KgxI
	3ZNOLbnyfc3vKearyzhaYAuwM+52Aa/Rq6ACG6fxtap5Dy7MaSLGG5spXdeiSuY0/pwxxY
	HGNSDcrHxvgnveHYgqD0Ehgr11xQa3cYclNzDm7Yb3h/bCFzp+y40guK7/4FE0pbeCBwqW
	noIzJAx4OJyS1d96CS0iF0m76tnASQIReyc1aOrOilasI3blMEQhfVCVtAMfmpTXPbtrA2
	VBnmxHax+ykTq92eQveU3Yc9zTFbFD/SXIE2xR5zRl8uyogkPGM3+vJQzDdbFQ==
Date: Sat, 23 Nov 2024 11:25:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] rtc: rzn1: drop superfluous wday calculation
Message-ID: <2024112310255821e4b03e@mail.local>
References: <20241122101448.4374-1-wsa+renesas@sang-engineering.com>
 <20241122101448.4374-2-wsa+renesas@sang-engineering.com>
 <20241122232625c5adab8e@mail.local>
 <Z0GLz6OJWhnhpIVB@ninjato>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0GLz6OJWhnhpIVB@ninjato>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 23/11/2024 09:01:19+0100, Wolfram Sang wrote:
> 
> > >  	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
> > > @@ -109,7 +96,6 @@ static int rzn1_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > >  	tm->tm_sec = bcd2bin(tm->tm_sec);
> > >  	tm->tm_min = bcd2bin(tm->tm_min);
> > >  	tm->tm_hour = bcd2bin(tm->tm_hour);
> > > -	tm->tm_wday = bcd2bin(tm->tm_wday);
> > 
> > With this, you're not even using wday anymore. This is fine as there are
> > probably no userspace users of the value but the commit message claims
> > it is now using it without conversion.
> 
> But it is still read form and written to the register. And the values of
> the register go from 0 to 6, same as tm_wday. So not even BCD conversion
> is necessary. So, I think it is still used. Am I missing something?
> 

You didn't, I misread the diff.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

