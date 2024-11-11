Return-Path: <linux-rtc+bounces-2515-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F629C47CD
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E583C28D500
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 21:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D656178368;
	Mon, 11 Nov 2024 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FKj+aXha"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BE9166F14;
	Mon, 11 Nov 2024 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731359450; cv=none; b=o5g1lCKUh9Omk3iDiqAVLum2SC/3qeloFr4srOtmY2OsUI3YgQkY5LwfjINTeHPU84r1gLPUbbTxqgBhLvqi5RfHN626Pw9+vhfiFJKh+8khjadJecyG8XBYvfQfn5vNleSoXpJMf1Ywp3mv0HSHF8DWOqvOdiUUvAPkjDlQvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731359450; c=relaxed/simple;
	bh=ti8p+irfLZJ4mjzMbawpecNlvLfQ4L5fkSpdXrswtK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjhgUXLaocgHoQMZ1e8R9wHfUp0YvtH2c7xqa/vUheDazXWogbm/woxCY49osKss04seZh39rOJutdGoCOWfq+zMwvmaFQGGTIlxm/XEZvIBuoIJgvo4xGerorZ2rIur59NqGLsfG4eKx9DVN75cNSwiT+EgQY9kPBB9Fetgiw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FKj+aXha; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B274E40002;
	Mon, 11 Nov 2024 21:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731359446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0LeZ+/RhCxdGtVrd+lbzGSBQcyAKbE08nkQhjQL5IoE=;
	b=FKj+aXhar3h2AgbdrVTArFeKO20PNX6r84N07/5Wu6FIaawEj9Ito4rZUqgNWMO6x1cP+K
	Q2u0wywdnXKJuqBpm5VJFrBq+lN273lC5wJUVR3B+91QpPs9HsyJTeUHuPUiVPQAC1ydAX
	lZP+RhSW6ioHP/8BUVPuz6VdmQMSjrSWx7IZHKeAk/xS0XIdCY/0USJSXFMeVRuN+E8QoT
	sx55Cn9lCkkwppW0e/aybmQtdVIeCpx7VvmL54Hg7PJnpoF9y5m4VWEn4VT/FSlv7svuAx
	O0SHyKG2MFhta2hYTOd6JiWlg0e4p9uCSc3kmujwiF2s3ghHaMRpL2JbyWrcdQ==
Date: Mon, 11 Nov 2024 22:10:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Jeremy Gebben <jgebben@sweptlaser.com>
Subject: Re: [PATCH] rtc: abx80x: Fix WDT bit position of the status register
Message-ID: <173135943496.3304477.11505100907848577294.b4-ty@bootlin.com>
References: <20241008041737.1640633-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008041737.1640633-1-iwamatsu@nigauri.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 08 Oct 2024 13:17:37 +0900, Nobuhiro Iwamatsu wrote:
> The WDT bit in the status register is 5, not 6. This fixes from 6 to 5.
> 
> 

Applied, thanks!

[1/1] rtc: abx80x: Fix WDT bit position of the status register
      https://git.kernel.org/abelloni/c/10e078b273ee

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

