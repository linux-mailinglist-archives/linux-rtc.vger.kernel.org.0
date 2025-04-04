Return-Path: <linux-rtc+bounces-3781-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA79A7B9FB
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 11:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7FB57A8A47
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32A51A5BBB;
	Fri,  4 Apr 2025 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSY37JVe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1782E62B8;
	Fri,  4 Apr 2025 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759042; cv=none; b=reVXMM+HXVP1Nnu+hG4PckABWw7zVU6gpmkZuQl3xntnyb9hNZbQLql98ejOVgjDvLJV6lh5Mh4D9HlRKbyDaN1BZb/ht9QKKes/Jlrgmjjbu3Ljdlw8effn8pDLXra1K9ORFa1/7rERhCmVUhN7VQqBhPjqDdDkoI/OZ5QmlMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759042; c=relaxed/simple;
	bh=nJrNlBkQnuThOsj6kBsx3+iq0NbYhsHpNmbL85Jx8Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EisoLDIWzZCqFTKqUbLH0CT4bhRKrz/1gGYNOxm4MDrZLJ73Id0iq5ZIFRv7Afr9Xd1AhHPvsISqNwXS9twRN3BvI2Iv1SzAD2F0UZ/1+Fmgt8vqNePWNSQ8mF/WjMeaOPDm1cmjTVTwLh7+vXTLx6tcXuvRG3Edvd+sFh6QRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSY37JVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5338C4CEDD;
	Fri,  4 Apr 2025 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759042;
	bh=nJrNlBkQnuThOsj6kBsx3+iq0NbYhsHpNmbL85Jx8Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSY37JVeP/zQpypBtXQaaCMZje8YFlYL3lR9+GbS2ME4hCi/elUvVS/zn2MC7clKu
	 P1v21m/mBhALNaaLIL7jxa4cRT/wcxFiJOELsTdtiBUu3LtaHKdF+LGYzxF43WL9l/
	 3GCPruR1a4BM/E1l46zXm5KLDVMk0Bq79CQp6DDhCqZP8LM9qO1EBnd4bb6RV0hAcf
	 s4AiJMjHg2XM3jT1B9OrvHU6z/GDg9poEyDdWWm/9WOuP6dX6ngyFTytBAeeMMfqmh
	 Rw5N13xBnyXvaYld2XzaCoYorbEVbB7Ap7KcazFOQ2/LvFT8WdPoRYtVgTMI2941nH
	 x3WApBX7IDJGw==
Date: Fri, 4 Apr 2025 10:30:35 +0100
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
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250404093035.GD43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>

On Thu, 03 Apr 2025, André Draszik wrote:

> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).

When you resubmit these, please note that MFD subjects take the form:

  mfd: <file>: Succinct change description starting with an uppercase char

As seen with:

  $ git log --oneline -- drivers/mfd

I don't mind changing one or two when they come in, but I'm not prepared
to manually change 20-odd.  That gets tiresome real quick.  =:-)

-- 
Lee Jones [李琼斯]

