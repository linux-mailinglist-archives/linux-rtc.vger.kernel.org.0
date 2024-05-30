Return-Path: <linux-rtc+bounces-1224-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B4A8D49BC
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 12:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A79282489
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 10:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12711176ACF;
	Thu, 30 May 2024 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oAOy5YTr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925266F31A
	for <linux-rtc@vger.kernel.org>; Thu, 30 May 2024 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717065337; cv=none; b=X8DWFZ7ELA8qNU8GjFbBB621RRkrTVtwpsUdWCxTqNze17bd9NfZNjQ0lpWtDO65xbSQ3v9jEPz8PB3htzXdK51+9Nk5//Pz4Ldmz+KYUFi5OaSIU9cGCLwdK1EIOYXJ/X9P5uY1GnJxsx4k78WyGZipZNJblp8wCbWkN0rA5m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717065337; c=relaxed/simple;
	bh=pqbD0N1NVf3e0qDthV00G/3+lY3IaSKXBvkC+zTxL8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWfxMmdlInZXFPPS1W7fYnU2nfm41yKLfJBCXHx69S09jNkz5SITm45JHcXR4hyEgtIOQ+9C2exB9kD05dupA+ELBXiriU+uUOEzzC+8OhzVvAgfWchjhH89NumQyPei/gmr/fH42FMsvHEzrrcn25L9FopEuAZNBPA3YkT5UYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oAOy5YTr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7370B20007;
	Thu, 30 May 2024 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717065332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZykNmxg7hR/8xc6u/yYo3ltmxTzxcq9jBsgTOcs6Og=;
	b=oAOy5YTrESsYOYx4ZW2wXReYowwOOJyLSRVbo0H+3GT11+s3U6f9bZ3oQX9ArUOORJ8Hne
	rEqNnPs2mzr73ETqj3Z72d7i08/sa7eMvgtjrLhpMaVag5RtJ8MV+5hlWE96X+gxML5S0Q
	bL9xHjrM07W7lsEzLO2Hj8C5BYEily281k8h4dGEda5EzsvVo+9AVgMLwz56GISVX4SGr+
	yR+nOBbe0jMDMy9/dGM8WTcUr6JjBbW6qb3FO4EtVXlTvcoMDaeVDmdwlRzMGFTCPkqZ/3
	tXz24404+FkX6vyG5UsRQhSyR1shCIf5XuWrfUVABNAn/Cfh3UEqxaG39xAYkg==
Date: Thu, 30 May 2024 12:35:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: Add UIE handling ability to rtc_class_ops
Message-ID: <20240530103532e6d4f421@mail.local>
References: <20240528161314.404383-2-csokas.bence@prolan.hu>
 <202405281756543dfd3a39@mail.local>
 <81184944-5012-41da-a596-220b74437552@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81184944-5012-41da-a596-220b74437552@prolan.hu>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 30/05/2024 11:59:47+0200, Csókás Bence wrote:
> Hi!
> 
> On 5/28/24 19:56, Alexandre Belloni wrote:
> > Hello,
> > 
> > On 28/05/2024 18:13:14+0200, Csókás, Bence wrote:
> > > Currently, Update Interrupt Enable is performed by emulating
> > > it with either polling, or alarm interrupts. Some RTCs, however,
> > > can directly provide Update Interrupts.
> > > 
> > 
> > This has been removed from the kernel 13 years ago. What is your use
> > case to reintroduce it?
> 
> The rationale was in the cover letter. Currently, the RTC core uses the
> alarm system to implement UI, but this causes lost updates on PCF2129.
> However, it has built-in Update Interrupt capabilities in the form of the
> Second Interrupt, therefore we should just use that.
> 
> So my question would instead be: what was the rationale of removing it in
> the first place?

Well, you didn't answer my question which is why do you need UIE and
especially UIE from the RTC? Using the timer emulation is probably what
you want because it is in sync with your system time.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

