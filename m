Return-Path: <linux-rtc+bounces-2538-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BF9C625D
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 21:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1083CB83086
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 16:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A2220697A;
	Tue, 12 Nov 2024 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKie9r9h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E1620696E;
	Tue, 12 Nov 2024 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429523; cv=none; b=mzs8xWspA+Kmij1PMUYbILw2mVZcuFa+VNcgVl1DIY2lItuyTMi5Og7d+h0KEtq1B/2lZOS7hzAJLEKaDppofPTJBP+2JgSgKk2o5sXvBtZDGioAOhwBXt113bHhYV0OAyg7eUXoTssMbvAOW6zJrGXeeAKGcQWDsfnOQ2xQQkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429523; c=relaxed/simple;
	bh=9e1PA53YYRtYMlLekJib+Ig3mtdKJ/Ud7BZpViX35Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK3JEAtNyveYFd2k4bxKanRNzZSQRHQ4seuJShUS/jES3o1geESeVOjRXgDomQtEQI7nf34xzo07IjN5pYSNiR8DTm4cpSrqn08qsu2G2uMBQNFabPfmEI97PwTEZfseLB4uE6a3hOvbnwnjI1uELho9KiZNsRJvsaF8ItrXV6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKie9r9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E5DC4CED5;
	Tue, 12 Nov 2024 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731429522;
	bh=9e1PA53YYRtYMlLekJib+Ig3mtdKJ/Ud7BZpViX35Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKie9r9hDpwVZ5sll0btwK/sAqFh59bT8hCQu0NLMUflt3PntqlA9DEnBWm2b6e5a
	 0uD6Ls89AUdoLDCu4X3EImxQAc7WyklX/9T9R24KZOeRds07sU67f6vQ4ttg9mQAyM
	 XCDknVV5iYenlP7aHiUoZAjT6VS8x/Sxlfvcgvx2pe/D6RZUUsqyI+w7IXpy2oPDam
	 9nyhcC0xXBISpjlcV2lzg9DB7qnCP1RInZdRRtnZe92BukyjuaEQUYFPXbA6O7AJoV
	 46isO0glyQekBgwRGhBO9tFzRhHQPwXg0xuC2yGKUk5vboWRowsWiZYMYAoYjJMiLJ
	 UxOv+ObHJN7fA==
Date: Tue, 12 Nov 2024 10:38:40 -0600
From: Rob Herring <robh@kernel.org>
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Thomas =?iso-8859-1?Q?B=F6hler?= <t.boehler@kunbus.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v3 2/2] rtc: pcf2127: Add 'nxp,battery-switchover' DT
 property to enable battery switch-over
Message-ID: <20241112163840.GA1151895-robh@kernel.org>
References: <20241111154144.163604-1-p.rosenberger@kunbus.com>
 <20241111154144.163604-3-p.rosenberger@kunbus.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111154144.163604-3-p.rosenberger@kunbus.com>

On Mon, Nov 11, 2024 at 04:41:44PM +0100, Philipp Rosenberger wrote:
> The PCF2127, PCF2129, and PCA2129 RTCs have the battery switch-over function
> enabled by default. However, the newer PCF2131 RTC has the opposite default
> behavior, requiring explicit enablement for battery backup.

Subject is wrong.

> 
> Add support for the `nxp,battery-backed` device tree property to enable battery
> switch-over in standard mode for the rtc-pcf2127 driver. If this property is set
> and no battery switch-over mode is already configured, the driver will enable
> standard mode; otherwise, existing configurations remain unchanged.
> 
> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 76 +++++++++++++++++++++++++++++++--------
>  1 file changed, 61 insertions(+), 15 deletions(-)

