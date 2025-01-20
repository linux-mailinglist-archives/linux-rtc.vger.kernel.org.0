Return-Path: <linux-rtc+bounces-2947-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08535A16761
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 08:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0741657CF
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 07:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB0618FC92;
	Mon, 20 Jan 2025 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCHphDUy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4B481CD;
	Mon, 20 Jan 2025 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358357; cv=none; b=j/117rcGByU0NDqFX8dHqYWOahnxJLO7+nqxaqtIq11ndZlVogFIntvMBz824iHKmLnZ2J6gG3g5AB2CCY1LgqIIhbVmQA4UQG2XPUfGqOY7TordihtEnl3j9cJUOJDIeTOJ1tHWXvi4UyJ8zLwgAwstC0UXf9P9aYPGJBJ+rHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358357; c=relaxed/simple;
	bh=4Q8EfOGic5vi435uo4DRNMXt5k/K2VG8jjRF5niVnAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xx+P8v6ABzlSC9PxBe/+QuX8UAy7c+N5Upw3BP4YS2C8mzrKeDhwd+bY4Vl0vDiwIbwQ1kqzfNpOrf3W+QUL3bvrU2CH1Ncsvdtm1slObPmGj08t1zwNTBzjwlE2mV0kBB2mnrgMnVsw5X3v8YVtb6e6jvJo293O702LvFAta/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCHphDUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8418CC4CEDD;
	Mon, 20 Jan 2025 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737358356;
	bh=4Q8EfOGic5vi435uo4DRNMXt5k/K2VG8jjRF5niVnAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCHphDUytn9JfvwCGHgTWQTP1DxVIH61r8IcPNTeABFvtYnKY1qlo3hV7QlpZb/IL
	 BRexW2DCDJMrqZSiiAnLjx7BXhWtkTuAuHHEDxlpLSvbccYYLg9KB3oAVTwHp1Xt6a
	 xHeCSyGoQuWpMQWtIMg+ruA+g6tO0BuG/T6LI2JGRpmbDkBXOyfK3WkwyfgReE5sS6
	 0c0hIsm0RvHBxFO4+l6Q1penf1PhZu07dwRB5M2VeSKqRwu1f75hT8WS2BJpJFHadG
	 0ZvkqUnO/TjeEys7QZTbnw/06EdKNT3YTT6v0m8e/g9SDu9eFOKYL1494RoGB2zijV
	 OluzIRIKuGC5w==
Date: Mon, 20 Jan 2025 08:32:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: PavithraUdayakumar-adi <pavithra.u@analog.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: rtc: max31335: Add max31331 support
Message-ID: <20250120-honest-daffy-porpoise-fb384e@krzk-bin>
References: <20250119-add_support_max31331_fix_5-v1-0-73f7be59f022@analog.com>
 <20250119-add_support_max31331_fix_5-v1-1-73f7be59f022@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250119-add_support_max31331_fix_5-v1-1-73f7be59f022@analog.com>

On Sun, Jan 19, 2025 at 01:17:38PM +0530, PavithraUdayakumar-adi wrote:
> Added DT compatible string for MAX31331. MAX31331 is
> compatible with MAX31335 without any additional features.

Your driver patch suggests these are not compatible, but anyway if you
claim these are compatible, then express it with fallback (see
example-schema and many other bindings).

Best regards,
Krzysztof


