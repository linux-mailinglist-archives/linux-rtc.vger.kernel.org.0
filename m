Return-Path: <linux-rtc+bounces-1281-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A010904D23
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 09:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A94A1C21D50
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 07:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F48E16B73F;
	Wed, 12 Jun 2024 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c43JDqBV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5E153BE4
	for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178649; cv=none; b=LGW/oQnyTYhKccRDqGr8THkNggytv2/lWBIFv5jwhrwh6YkOJFVCvZQJmoSdMyC40sEATiIpfNOjTS3rml6QQ22WEihYEgQdah4ZEJzv8NJHjPbDyjPBue9G8mZTtc5XWVWetGQXN6FSV9/nJjPxDQfHlcUrJYdlyPc5lCovigE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178649; c=relaxed/simple;
	bh=6j5nmVN4/w954+EEjbFJDKGz9HKp0nWVC4rClE8nQ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHGSClXCuinuONL1PaaL2NKLSaQsizCZ5aaTOcElLZcVtwUmqG9JCKjFqSKl2XPamrPbcivhs1SoFZlLLxxYc5FdyS0nP8yy6m7oaW3P8X7Vlgg5za74cWit84VaejmcEIa2ld9bmlXCy91YRqo2Jd9hUoRfnuaGYVaRop3R+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c43JDqBV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718178646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6GIpVOdJiR3MRab3lILOz+mNYVouRDpopjjgMvEJfs=;
	b=c43JDqBVakoTwITnJONUD7LyRDoGP35AtOEvIh0Y3M9YocXp6wCUaxU3y5T/SUr5uVJXWO
	40f2iJawmcacSTPBCSNG8yAUaaQlmA+1/O3cr78Fd45IshGqo1eDV+y0BL8CN+YOsbeaIT
	G0xnPOTj8GyZe4HVisx1It5BhwyWpcU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-DoC-gBKDNa-qxr4Nxyi01Q-1; Wed,
 12 Jun 2024 03:50:39 -0400
X-MC-Unique: DoC-gBKDNa-qxr4Nxyi01Q-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C688F19560B2;
	Wed, 12 Jun 2024 07:50:37 +0000 (UTC)
Received: from localhost (unknown [10.43.135.229])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E1A119560AF;
	Wed, 12 Jun 2024 07:50:35 +0000 (UTC)
Date: Wed, 12 Jun 2024 09:50:26 +0200
From: Miroslav Lichvar <mlichvar@redhat.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Szentendrei=2C_Tam=E1s?= <szentendrei.tamas@prolan.hu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds
 Interrupt
Message-ID: <ZmlTQsgRiW9fmYcB@localhost>
References: <20240611150458.684349-1-csokas.bence@prolan.hu>
 <Zmks31shpsnoLQ3k@hoboy.vegasvil.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zmks31shpsnoLQ3k@hoboy.vegasvil.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Tue, Jun 11, 2024 at 10:06:39PM -0700, Richard Cochran wrote:
> On Tue, Jun 11, 2024 at 05:04:57PM +0200, Csókás, Bence wrote:
> 
> > PCF2127/29/31 is capable of generating an interrupt on every
> > second (SI) or minute (MI) change. It signals this through
> > the Minute/Second Flag (MSF) as well, which needs to be cleared.
> 
> This is a RFC, and my comment is that a PPS from an RTC is not useful
> to the Linux kernel.

I think a TCXO-based RTC can be useful to user space to improve
holdover performance with NTP/PTP. There already is the RTC_UIE_ON
ioctl to enable interrupts and receive them in user space.

The advantage of the PPS device over the ioctl would be more accurate
timestamping (kernel vs user-space). Should PPS be supported, it would
be nice if it worked generally with all drivers that support RTC_UIE_ON.

-- 
Miroslav Lichvar


