Return-Path: <linux-rtc+bounces-2486-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4489D9C3540
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 00:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59CF11F21103
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B5E145A17;
	Sun, 10 Nov 2024 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Aw331g6A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20BD647;
	Sun, 10 Nov 2024 23:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731280057; cv=none; b=OF+ufzm8Eq9IY71qK05pnCoQZ9Ec4CTVn4mB+YbJrRJUslwcu//PivewAPS87ztlUjAtHPhDIXfNfQosh3abznZkflRSDYX52Z/Ff3+AFWPDvephMov0xYS4/+TVs2nxu5FTRYE31TCaY/tecw2RBikzQl7kZoTEoT7Zm+V+Tb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731280057; c=relaxed/simple;
	bh=YCiJLqgE/+ORuOIMXJMF+gS543VBlbcaW4MsUQgMwIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYFftQr3k4aEipXSvCvMpvul8Rjp/ftb8SqFsyD1nI+bkag3sWZQSBxpd6L0OE5nka32FD6Nx2htaqq067s8VnUCtDfkjjDBPG5zo/XxuMgMW2pHbNb+B0rf0YJvRmfOt5e3yDm57hbCyyESmkXL3YsucElY0whapQ51FotpDq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Aw331g6A; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71563240003;
	Sun, 10 Nov 2024 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731280052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03vAuxqA4NMD9rUvnJjL8xcPWjzMwBZpzBa1pX3H2k4=;
	b=Aw331g6AAN8HWgF7CX65vRaADWt1d7w2Hm0d3kOxf/T40+425rriUPRzBDnVP6OppSYiBs
	NGWi9uB7ivNX7kiL0QXRzGYsjGOM7R9LzG7jpWXLBSQkDf6zIT75N8RRiijU1Fi0Y4ApSI
	hauzd9mfLwHQB5L9NrZry6QjZ15iGEIWoSLamL+55y94wOpXEicyXIkU6FEs9qEfpOO3Y0
	TOb334EetOMIc4xCJCLJ9wqjH+zW7zuFd2N5SO7ZYgKWj+J1u61NjTP3+jwLBosQ4jJ9p4
	Ks/2WA7SXgQ9ohapVEMmBOi0mAgIUcNO+2VUkQ7aOhqHqfhwVw9LUDb0A81y4A==
Date: Mon, 11 Nov 2024 00:07:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Esben Haabendal <esben@geanix.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] rtc: isl12022: Add alarm support
Message-ID: <173128003850.3029485.17192040022999942503.b4-ty@bootlin.com>
References: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 13 Sep 2024 12:29:11 +0200, Esben Haabendal wrote:
> Extend the rtc-isl12022 driver with alarm IRQ support.
> 
> 

Applied, thanks!

[1/3] rtc: isl12022: Prepare for extending rtc device drvdata
      https://git.kernel.org/abelloni/c/d4a6161f242b
[2/3] rtc: isl12022: Add alarm support
      https://git.kernel.org/abelloni/c/c62d658e5253
[3/3] rtc: isl12022: Replace uint8_t types with u8
      https://git.kernel.org/abelloni/c/5a36826a5909

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

