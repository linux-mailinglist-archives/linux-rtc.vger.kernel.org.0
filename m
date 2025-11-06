Return-Path: <linux-rtc+bounces-5282-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28767C3B7B4
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 14:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FFE51890DC7
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B3B33469D;
	Thu,  6 Nov 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByGmuJzM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F727FB3E;
	Thu,  6 Nov 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437401; cv=none; b=ZNAeSPWaRQs2Qz0gzhPDGIB21bn7J1KXNYcmiszDv7NHBGCJVWvuhzW+KCxeEV8duS1OhsKFMjr2v9Jxy2eVL0LXu8kn0GQRqGhvYW9OhnuHwOAIlaJDpfZq76fYdlC0yqU37IcONLa+PLCYElAwviE15QomYwMQluHdrO5c0+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437401; c=relaxed/simple;
	bh=CAPtG3qawnkmkv2IEXIZXUOloOY618BfaIpnP1GF1Mw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MspMTFjBFdMjuCzpscLnjPq75GDwaJFuNK6a2AIZN4pOjkOM4byNX/fsfR49b7ogYm66psbtkB3cHqxOmg+fFyAvrxBpja53qkH7L8IIWtbNF1hz3OcLoc5vIaiSmvJjcrW8gIju9AZ6or4oE8qQ3ghbUXFQRCF7fdN6EI6OPL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByGmuJzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC85C4CEF7;
	Thu,  6 Nov 2025 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437401;
	bh=CAPtG3qawnkmkv2IEXIZXUOloOY618BfaIpnP1GF1Mw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ByGmuJzM2cujoKMGT/JaCi6BvzNoQnznyt/Q878ToDqrJHMubMPtbW9IU4uGH3ypg
	 KfEMXXduaJJQ2nYIbJh5D1u24H2y2i3aWOdDVcejcq7a96IXDRN9skun5LzhGbg6X5
	 0NVwfmflt+6Zk8xzrdBXL6UUMA28HEt8dxieQ/MZjtPbMbMdMHkw4PuqfTzlUqgRaP
	 XXl/yqQRRel+0yztGVDIH/z3X3e5DRGaVSdgaMsjsQoOXxEBD3ymVqsqZJVTMFMnSg
	 s2nzTLI3+vnePHqS6U87XKAsaLNdrXzw48bi2tzOXLvTGRUK5gRyKzTe7Zz8uEZBCN
	 nDUP+GvX2YXNQ==
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20251025-macsmc-subdevs-v4-5-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-5-374d5c9eba0e@gmail.com>
Subject: Re: (subset) [PATCH v4 05/11] mfd: macsmc: Add new __SMC_KEY macro
Message-Id: <176243739664.1858806.689981774095492869.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 13:56:36 +0000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Sat, 25 Oct 2025 10:24:36 +1000, James Calligeros wrote:
> When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
> out with 'case label does not reduce to an integer constant'. Introduce
> a new __SMC_KEY macro that can be used instead.
> 
> 

Applied, thanks!

[05/11] mfd: macsmc: Add new __SMC_KEY macro
        commit: 8c3290b4c975e35a01aecfb51e0e004b6f7c0480

--
Lee Jones [李琼斯]


