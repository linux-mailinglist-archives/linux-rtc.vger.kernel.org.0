Return-Path: <linux-rtc+bounces-2195-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E36B99E135
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 10:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F00A1C2192E
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 08:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7447D1C82E3;
	Tue, 15 Oct 2024 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEvujXsV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F718BBA2;
	Tue, 15 Oct 2024 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981335; cv=none; b=E157VukbHVhslOMfCWmT8tPL8AdBwfBvyPfvvpHpF0xvnQLxU1J+nFrjrcigtMuaRWS9b8UrWbrw0C2CtCmxvATJOXtjgUqied6mnzIy2T2rudNWLwdUJ/mc0sU74k+Ek8v8TqMnQoqIL6tiM7d6ghIpgZNr6SS5dnP2JSe3hsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981335; c=relaxed/simple;
	bh=FkBL0evStCVS8dlsZ+Y8TcB2myAW7+su0Avn4WsD4IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6Q+HYas3G9UOBTdEZx8niihRudq0Lkp/lxGp4xZgLYDGGZ1rEHBUDs0szz3+837hIpyr5unK9gAfw7rm+AWqKxtWaIC66trqvDo9z1KUa/VGHYig+UwlZ+eNeQUNa7jnEDK/ZzSgdLSGcMwfoAnuvq16uXvWvb9yJXuaUsZuu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEvujXsV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55311C4CEC7;
	Tue, 15 Oct 2024 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728981334;
	bh=FkBL0evStCVS8dlsZ+Y8TcB2myAW7+su0Avn4WsD4IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEvujXsVcmtonuP+iPGNKQwDyD7soRLBA/VX3rfOI5A1LpbppyMP+pHIVDCSuYyp0
	 A9qQasAWTVL2o0T/fkYnq8GzSPnyfxmNd0IUKdgCZWCah0VRpmjyTsziubhb+mH9VA
	 9Qa8hh/QcvMCznbWLvjwkma/Pe4p5oWVwr0CZ4JWyXc7+VPN+pHKXeCOTLan0ExNmm
	 tKZVWmHQku0KXcqxXDDnCHFKngSb+sn/hvB2TvzL/6VCg6mtBdyu55WPF55LVeig1f
	 D/68ayB+LSKgmhjnCbii6fGX9dQZQ0vEbMpUepaAWfNz5QMEvIIH4DDqLdeaFYoeHU
	 LrTOKjDEVyk7g==
Date: Tue, 15 Oct 2024 09:35:30 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [RFC PATCH v2 2/2] rtc: add driver for Marvell 88PM886 PMIC RTC
Message-ID: <20241015083530.GA8348@google.com>
References: <20241012193345.18594-1-balejk@matfyz.cz>
 <20241012193345.18594-2-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241012193345.18594-2-balejk@matfyz.cz>

On Sat, 12 Oct 2024, Karel Balej wrote:

> RTC lives on the chip's base register page. Add the relevant register
> definitions and implement a basic set/read time functionality. Tested
> with the samsung,coreprimevelte smartphone which contains this PMIC and
> whose vendor kernel tree has also served as the sole reference for this.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
> 
> Notes:
>     RFC v2:
>     - Move in the register definitions from the preceding patch and reword
>       the commit message accordingly.
>     - Rebase to v6.12-rc2.
> 
>  MAINTAINERS                 |  1 +
>  drivers/rtc/Kconfig         | 10 ++++
>  drivers/rtc/Makefile        |  1 +
>  drivers/rtc/rtc-88pm886.c   | 97 +++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/88pm886.h |  9 ++++

Acked-by: Lee Jones <lee@kernel.org>

>  5 files changed, 118 insertions(+)
>  create mode 100644 drivers/rtc/rtc-88pm886.c

-- 
Lee Jones [李琼斯]

