Return-Path: <linux-rtc+bounces-2481-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 122129C34F9
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B07AB208A8
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 22:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B77157487;
	Sun, 10 Nov 2024 22:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jm+FBSgX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA96D450EE;
	Sun, 10 Nov 2024 22:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731276372; cv=none; b=qVGnLQdF0VtUaVtS6mq7aUmJCqPz8L5mdGdsbHPp8piQL72JKv+TrNG9SzhNR2FXETDkOULNxJpgLCiwcArJ71IT7eaqRSoace2DL4CqTEBohR/k1zCxkUaKbgbFWJ5TuvWFG4rxa9aSgHL4T3Ha6u2dKJ7ySOJPGUoaeKZ8w8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731276372; c=relaxed/simple;
	bh=n+IHXW5RM22GC71kuf/Lj/vkFgXLse9fLa/GZtSUN34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orrb9QYcfm6NIRX0MI+a0FFl3X2j9KGLQHUGh0gTqKxR1oRKD0W6Pfkt6axs9aqcwKPAZQTvT75pPk0Ea0ZjBphl255AuNpyNTezh8f0DhAgvjJIk9jEsafIC8GNu2Z0ilWHvY12DLI/tgMJmgvZ1ClZs3M2xLI3ApX5gK5zddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jm+FBSgX; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3DC5E0004;
	Sun, 10 Nov 2024 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YDwhlA1kXwgbHqM4MXEd7UON/CdbvjgGbhIDUJRHFmc=;
	b=jm+FBSgXOg9Z8pSBauo/83rTNc6hjdkio3Lgr49I6fHa6+RL+daXSAwJ9rsoRBwNn3ZGaj
	7uZDNxtXTCLpsgGWGr+qQa2sqloIHQwhdg/kPczgsM40ZlmMznWj9GQ6Stm8cmThGfrSIr
	xRjjkLTPlzXcJmA2EuYvLC1PXF+NkufefgGIs9/F/GJstLRXzfzBI/ojqB8QW3hzrY8E2b
	0hYXHIQEtJsFxxU27HbW3smZd0QUhARLoe3OwU+0aUQbdT08JNLPD9reOnzsDuNE0YrwUt
	S29n383cyz48upkKoxjRfVVBcXahoELATDPCWbJD9l3UZ7jONxeKhQetCzLbqA==
Date: Sun, 10 Nov 2024 23:06:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: macro@orcam.me.uk
Subject: Re: [PATCH v2] rtc: rtc-mc146818-lib: Use is_leap_year instead of
 calculate leap years
Message-ID: <173127618344.3020900.4797901127301487969.b4-ty@bootlin.com>
References: <20241007233618.1442937-1-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007233618.1442937-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 08 Oct 2024 08:36:18 +0900, Nobuhiro Iwamatsu wrote:
> The is_leap_year() for determining leap year is provided in rtc lib.
> This uses is_leap_year() instead of its own leap year determination
> routine.
> 
> 

Applied, thanks!

[1/1] rtc: rtc-mc146818-lib: Use is_leap_year instead of calculate leap years
      https://git.kernel.org/abelloni/c/49fd6f907f46

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

