Return-Path: <linux-rtc+bounces-2523-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790BD9C493A
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 23:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 936B3B2BFAB
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2034A1BC070;
	Mon, 11 Nov 2024 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="isYmqPrx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1489616A397;
	Mon, 11 Nov 2024 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364706; cv=none; b=dYzdQVRW/UuRnb8Pjp3SPYw0YYIYh1HvL7WLqXbaaKy+ZeEV1u/NlXuK1y5HLFJlCjnVo3A7CaqONRtzqBY/P2LXkQALVW35BAXX/jSVVLBBS62OVLCq4//9cwQt4uJEzmnBNWDZnOId1QMphnbP9sGmbnj7XxOYp8XuzH8yoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364706; c=relaxed/simple;
	bh=ezgBp0OiUklVcQkAmAGvLuCXu6kLrPSnGeH+SLqe5qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CroZbrbCic1ffSrcBKW/4kt7cT7IQgEge8Q4ms0Eo+aBY4tblMWRiaKfEYdWUsNow4d65rMTMQr1y5IWkmPvg4LmARlzs5tIyClDGVsR/bwDxrn3OJ5qQaTkzJCKSzuryRxMbJ0/rYLV11vEn3s7eCuiLC+3lD7TzrJjsvwtirc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=isYmqPrx; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8D9040004;
	Mon, 11 Nov 2024 22:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731364701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O1pzwuADAzfsdMGaYJ/d0maoN/OzXSICb91rVvmlWD0=;
	b=isYmqPrxaNejNrhw9iEQfhWZLjoiUXLmf7yui5HbMvCyNoYxxGLgd8iivnWj1opDSicOaz
	eUxuifbzwO4tE/2nT5hrciwDvkIja7DZ1tbIcyilZSgvHjLoRORJZj94fRTAArnCjh8gCK
	p3MVyc2peBgdwb2/OiGXCnvdGBtAVA4Q7Ox4ha3JUAXYtAfN+YHLs6BzyyeOYiYDX9E1Em
	I+B0zIh4dheHLN/IqGUaaaBmI8VOGHu8TO+qRBw+d+0Fpkl5YQwiB88zUteEFKl7sWUHzW
	65IdyRtUFy583SSH6tvPGLuE36oDMDDjS6k5ymrDrZbsw77fc3vhF9zME1HFjw==
Date: Mon, 11 Nov 2024 23:38:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Karel Balej <balejk@matfyz.cz>
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [RFC PATCH v2 2/2] rtc: add driver for Marvell 88PM886
 PMIC RTC
Message-ID: <173136467942.3325244.16776856228590309167.b4-ty@bootlin.com>
References: <20241012193345.18594-1-balejk@matfyz.cz>
 <20241012193345.18594-2-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012193345.18594-2-balejk@matfyz.cz>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 12 Oct 2024 21:31:39 +0200, Karel Balej wrote:
> RTC lives on the chip's base register page. Add the relevant register
> definitions and implement a basic set/read time functionality. Tested
> with the samsung,coreprimevelte smartphone which contains this PMIC and
> whose vendor kernel tree has also served as the sole reference for this.
> 
> 

Applied, thanks!

[2/2] rtc: add driver for Marvell 88PM886 PMIC RTC
      https://git.kernel.org/abelloni/c/82ee16cfb290

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

