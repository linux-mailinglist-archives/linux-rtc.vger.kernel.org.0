Return-Path: <linux-rtc+bounces-763-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989F86D62A
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Feb 2024 22:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCB2D1F23E73
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Feb 2024 21:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609E816FF50;
	Thu, 29 Feb 2024 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ObwgrMCy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B53110EF
	for <linux-rtc@vger.kernel.org>; Thu, 29 Feb 2024 21:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709242181; cv=none; b=X30s/QwHnlpiTLYJeTY8KkdWKIuYnGLIxpO6jSDqJGOz8iq7nOqR618hgYAzthmfdRufUscjpCsMJADNHEntGTtYFBiExx+NZdg6KNpTDirwkkXS38/1x7Jpmic2m0FMjZKbL4pCch38w83q5qO2RQiXvJATsq4flRUwkh/t8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709242181; c=relaxed/simple;
	bh=OGcArJMIJd4y/6626ogxy7+Jii3xU9c5Ri+tC6OEeW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBXkvBu5JL+lvWsdFugntTK8J09cYxC5OEY0Hpecqpo0flreX/ZHn6paeTCTKTkXcqIYTHL/R/34bhoOW6GenspP+3AdRB3Sxob0sdGIoGaSH9pj+Dmv+wSNummcKPHbmb9M5b0dCbcX/VsSHwvs8Xr7k3unEK56j9ihf/CYh2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ObwgrMCy; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20FEA60006;
	Thu, 29 Feb 2024 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709242177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hHwgTPW06kFF/pKVHrJJas3uXFQf1OvJWa7UmlCUI3g=;
	b=ObwgrMCyYCJRea1vZbPoTtUpXIBbTaSCoTOjKGDtkCuqwqoxk/GjJ7OojQ0nnGB14izlZx
	f2y1uWGKK98VhZjtyk1q9Df2R49+v7wpiOUI4EIcrUu0oumtBDSensik8aYJntSBE/82vU
	+UgSFoqpwBtyuLQJxrDzPCY6pkNBwIzuGZULrEQaQhxfH2oRoZFH/P9iFsfB6F0YUYzoxC
	i6N2JWAmHLPX/Lz5CXoLlW6fZeklgUq7X4IdpPzKNRYP8P7WveW/WY5MZ8w4U1Spojm9hi
	AxFh10HX8mfuZiNOBfvBHrMWQBA17ANeumk5Q9spkLgrFTkuPh2LGlPZ93xwcw==
Date: Thu, 29 Feb 2024 22:29:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Curtis Klein <curtis.klein@hpe.com>
Cc: trivial@kernel.org
Subject: Re: [PATCH] rtc: m41t80: Use the unified property API get the
 wakeup-source property
Message-ID: <170924210561.1874336.5868427380809075053.b4-ty@bootlin.com>
References: <20240222011129.79241-1-curtis.klein@hpe.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222011129.79241-1-curtis.klein@hpe.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 21 Feb 2024 17:11:29 -0800, Curtis Klein wrote:
> This allows both ACPI and Device Tree systems to specify the m41t80 as a
> wakeup-source.
> 
> 

Applied, thanks!

[1/1] rtc: m41t80: Use the unified property API get the wakeup-source property
      https://git.kernel.org/abelloni/c/3100fd1aa8e4

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

