Return-Path: <linux-rtc+bounces-5508-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66778CAE45E
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 23:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A8FE305480F
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 22:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD5D2E0925;
	Mon,  8 Dec 2025 22:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hGj18B5u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69B3211499
	for <linux-rtc@vger.kernel.org>; Mon,  8 Dec 2025 22:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231687; cv=none; b=cciBXgxS2dJbCLYjbJwNezeYZ+cUJ6U8SMSJh1aMyTvz9wRDfT2IUhbJ3/X2yBaYhDa77NbflCfsDGGWvT3Jnja4AVbtfL3aIp5z+4L+tFsPNZ1V9QMuyD6RF+aqt1IO094YtJ97hRoyxvmmPYe0dl/Vfxzuyo480sxc3IDYrmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231687; c=relaxed/simple;
	bh=jSLtEXk/dEydZxBojgsNKyWqJvZK3447W5P7sn0+T7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaw0dCi17Bx9xW/Ah/WnpKlbfbqfynIbOgKAXW4Qhg65bpM/5Q8pTV0FVdrl9UpwklfMF0/JHMs1CBAxGScxFZsdgrkly2AX/pyPB3QVDAzSwBIiH06L+ndv4r3yHOtZQ3fjtohzKRHgMQxzQBJOzc0yrfkDU/3NkZbn7Q1p3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hGj18B5u; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29477C180D1;
	Mon,  8 Dec 2025 22:07:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF8FC606DD;
	Mon,  8 Dec 2025 22:08:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB165103C8D5C;
	Mon,  8 Dec 2025 23:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=cdWkRmbD0E475HQLPH6kL5swD6zlOwpQpkc8ID1WIjk=;
	b=hGj18B5u9LYRxWP9SUirs57JKm/b+rlKc5Eui/Iyr+Ppu/Xl6uiSiKq7y0kxGMHckIUQNx
	jAJNWKGrpH2qdzsjzsI3ASXeEO3CZs0w5epnk5aDDaSMyL71NpEb6Fi8Il/maWmZUTWm2t
	6SKQjvoTaGKqIcc5sOG4OjniSy2AdI5TTrGk848Kykyi1wcvf2VsyPJsn9rtCnZUmToV9X
	4vPPiLzLsU+p1VQhC+OxFDC+KT/oVTTqY+iPLF1COdWPeYvt5EstpjSkwVjlBzsektFUJ2
	kdEkNaGXIYwX8HJ61sFfUv9M0EzcXF701Sm8zg6qFHwiJs27tRo7kR/GZzHmUw==
Date: Mon, 8 Dec 2025 23:07:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ddaney@caviumnetworks.com, david.daney@cavium.com, pombredanne@nexb.com,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: Re: [PATCH] rtc: isl12026: Add id_table
Message-ID: <176523152345.342815.16512362742689126841.b4-ty@bootlin.com>
References: <2025119-54859-2010914@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025119-54859-2010914@bhairav-test.ee.iitb.ac.in>
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 09 Nov 2025 11:18:59 +0530, Akhilesh Patil wrote:
> Add i2c id_table for isl12026 rtc.
> 
> 

Applied, thanks!

[1/1] rtc: isl12026: Add id_table
      https://git.kernel.org/abelloni/c/e0784949c65b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

