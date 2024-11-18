Return-Path: <linux-rtc+bounces-2574-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69D9D0F9D
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 12:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15DB0B2A8EC
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 11:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB388198A0D;
	Mon, 18 Nov 2024 11:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hs6gpyhY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB7198A01;
	Mon, 18 Nov 2024 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928367; cv=none; b=tCu14KCWzKheJt4kIQud1UlJjofzYAR39pb8cII1KLDpP3xLD5ygSwGRQtjSnfdeNVqpQs2xrr2+8d8D81vnD8NovEAX/bNChSPhoyPv9blrbWObX7wBR9Z8j/FbC9sN0h6kdh4W6zyWlyrZv/Kp0Ajik9bKZJEjf3lOtkGBjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928367; c=relaxed/simple;
	bh=r3+TnaMBYDIL91epO5/2SarRsn95qrkddIU6Vic90g8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgg1z/RT/4NRaJVi/3AvARtLb0BL7ayTykZ95V9e539YuAuwLQmmEwSi5InP5ddyCA84c5G2oIiELTSI6lRBAu+BhvqYWllIdwvO8hncFx/VGf4SNCxx0AcNRzafl8rqIlE2X8kLrCDedrN8tiY/Mp80h3rVUjirJGVkW5bhKfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hs6gpyhY; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EB7124000C;
	Mon, 18 Nov 2024 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731928364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/tshPBb25NT3wRUZuZ1WxJ6nCXgGL1C9dONS6Lxxy+c=;
	b=Hs6gpyhYgQPkRPCLrblBOsJS0brsLnLTzrd9WXxaQYn5brfX2rqjko7t3bjcvksqGAtumK
	c9j7Ft+nrP2Oz2wxsreBGLB01GR6wAkAfac17GBv7PkbWbX4pw98/gFIOksxJZq3jixyQt
	gG/3UrRNSxQ/t3YAmOO4wy2cfuEIyFjldElLQ5U+nm90VmiZQbFo/F3qeK0jLURZ51Y109
	xybBqZKLEhTiIf603qGoFhJeG1ws07zEg1AvOk2vKDr+RhZQZ5Cylkz/W2fytOrVOQmOhs
	k+3e1mKQ9xGlOl0twyUFKoealCFmGecW09E8kFsSpCnmmGH8suMf8zdfmzS/GQ==
Date: Mon, 18 Nov 2024 12:12:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	Michel Pollet <michel.pollet@bp.renesas.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: fix BCD to rtc_time conversion errors
Message-ID: <2024111811124370f0da32@mail.local>
References: <20241113113032.27409-1-wsa+renesas@sang-engineering.com>
 <87o72gnvbu.fsf@bootlin.com>
 <ZzsJQO80dmhce_Mp@ninjato>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzsJQO80dmhce_Mp@ninjato>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 18/11/2024 10:30:40+0100, Wolfram Sang wrote:
> On Fri, Nov 15, 2024 at 08:36:05PM +0100, Miquel Raynal wrote:
> > Hello Wolfram,
> > 
> > On 13/11/2024 at 12:30:32 +01, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> > 
> > > tm_mon describes months from 0 to 11, but the register contains BCD from
> > > 1 to 12. tm_year contains years since 1900, but the BCD contains 20XX.
> > > Apply the offsets when converting these numbers.
> > >
> > > Fixes: deeb4b5393e1 ("rtc: rzn1: Add new RTC driver")
> > 
> > Should probably be Cc'd to stable?
> > 
> > Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Thanks, Alexandre do you want me to resend CCing stable?
> 

No, this is fine, I believe it is going to be picked up anyway.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

