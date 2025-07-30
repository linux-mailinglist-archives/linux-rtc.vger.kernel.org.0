Return-Path: <linux-rtc+bounces-4608-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17807B16329
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 16:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A16B3A30F3
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 14:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78872DAFDF;
	Wed, 30 Jul 2025 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Orzv+H6t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2AB277036;
	Wed, 30 Jul 2025 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887068; cv=none; b=gTb7hKEG1Dg6TTkFXIavQWM9qxFihitTSFyqDYemfl6/U8Ajbd4giBbMYtOuIltwhTBmo1MN9OrkMg1Xm/e48tzo17JSGSpxlhV6jBXfIId/gkr9Uo6hxrdo4qAT3T7w4f0R8+OSUPPr1uQcumHqZ3zIeTSThe9fnHNPFcbeVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887068; c=relaxed/simple;
	bh=16P5bJs+DSDc/BjPMR9Go7+cwZRcZib97tLNoQMS560=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiMHbmne0QLv/oF3w3kpNTpESjKjlMn1cO73/i6KwhnOJqXrt+9ppqb8khVg2V1BlwF1yD2ZSfEvcq2r6UottVpKge7Ri4MNAzzj48p1yDM3M6Cj9i21f/67vG4JojL/FzUqPxITsQBKltDX+/uVZf1Q5rLYuwMh9UAd0bcT/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Orzv+H6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC63C4CEE3;
	Wed, 30 Jul 2025 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753887068;
	bh=16P5bJs+DSDc/BjPMR9Go7+cwZRcZib97tLNoQMS560=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Orzv+H6tINJf2jMXAqag/2hlzgi49AmaSDRnL9MhklbvGcjN1pi3yw4uEFi2lTpZg
	 3lwlhBWxQtH5UqRvAJKEZWUe4tjaMcoCPMzKAklGRwio/GzocdrjFGixBs0vLrl4rd
	 bHKjz+y5Prb/TfSC7f7pzF0G1bVB2R6MqNyny0JgZifRPWvjHQ7kc0qQXRbe3FLDRP
	 M4manPrF/C1KU22Hzb4dv+p9teKDVyAwBgEdaTUui80kS3+QMum3NBTu4z/5+dTScF
	 ChqvKJx4ymmEw4pdsSz3DxPRyMi/ih0QSfLfk/i5jGdeI2brM/sgFt/Gp+rUGRrOfx
	 SgYpcQ9h7ygHQ==
Date: Wed, 30 Jul 2025 15:51:00 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250730145100.GA6782@google.com>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>

On Wed, 30 Jul 2025, André Draszik wrote:

> Original cover letter further down.
> 
> This is a resend of two patches from the original series that haven't
> been merged yet. That series was merged except for the attached two
> patches here. Other than rebasing against next-20250729 there are no
> changes to them.
> 
> Lee, I think Stephen's intention was to get these two merged via the
> MFD tree please.

Although I have no issue with this, it does seem a little odd now that
the set consists of only Clk patches.  Let me know what you / Stephen
decide.

-- 
Lee Jones [李琼斯]

