Return-Path: <linux-rtc+bounces-2138-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CE9980B2
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27271F29584
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 08:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935F71EBA1E;
	Thu, 10 Oct 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9u942BA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655891BBBC1;
	Thu, 10 Oct 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549364; cv=none; b=qW9jFex1iOMyyIEZqNsiNwFNPcfmL8GmLW/wWdblPp/8O87JYQrd5Z3R5i8kOoAEIf5C/MHb0pfa0Em6hmz/pDKBXbgZw4c9ca11IKb7gf3kj/cAH2XwSNOIdrr33nT4T2RvDdKd4iRfBBJUsdxHaxr5ebxtkssnLnQSUsQdKQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549364; c=relaxed/simple;
	bh=K5JeHAfm/mm9S0n+xe3Gonm7pfA4YTpAfE9+fbvdkxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3SU0l/V/ncM4jXFZ2mdLujeNd7x1/ZAorquon3PbugEqDoEl4STFhcF3GjKIP8QPMDmYrE3J2C8eOzFYpjIyLt09BDNosmB/RL/opyOBzN/DI49Dyc972q1L++2x/Lxr6rv3V+6H/9SnaR7DDdMUfkn4YznC+HKZPGLXQ8sR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9u942BA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE38C4CEC5;
	Thu, 10 Oct 2024 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728549363;
	bh=K5JeHAfm/mm9S0n+xe3Gonm7pfA4YTpAfE9+fbvdkxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9u942BAq1NyLrpvbtHB1gyvdceq9G2xLvTmAIh/DkMOOG/WVB9ekLG8AN1+FNmcz
	 WMhzM4NKYnrqLZ5zhtoUol0gkMKeD2wTjHiAMDMkLm13ViaLbgT8fnjrVx9NJmiBdy
	 fEZ97vajjgBTpCB0CUhGA780nRdXg7FxTWp//7jXL9anNML8KVFPQ4286gXWy0VskW
	 goi+4lPcwAboHNqgoH+qWFThPhmYS4VCxbbU97RN8yEpyv0BQYU2MZucXA9yDXkJAN
	 xzePM4S7Jdt8fyEKvTqfKWMB0NOIaErP8qVylAxSLAobXalTYAXr5dt/VzPf/98x2X
	 4ZB/xogveaseA==
Date: Thu, 10 Oct 2024 09:35:59 +0100
From: Lee Jones <lee@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and
 relevant definitions
Message-ID: <20241010083559.GD661995@google.com>
References: <20240920161518.32346-1-balejk@matfyz.cz>
 <172846840369.471299.4136306941601177946.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172846840369.471299.4136306941601177946.b4-ty@kernel.org>

On Wed, 09 Oct 2024, Lee Jones wrote:

> On Fri, 20 Sep 2024 18:12:34 +0200, Karel Balej wrote:
> > RTC lives on the base register page of the chip. Add definitions of the
> > registers needed for a basic set/read time functionality.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/2] mfd: 88pm886: add the RTC cell and relevant definitions
>       commit: 0a936c2c45884b9a3800379f3cab4d0a685d63f5

Unapplied, thanks.

-- 
Lee Jones [李琼斯]

