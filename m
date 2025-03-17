Return-Path: <linux-rtc+bounces-3532-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D34A65452
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 15:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBCEB169E53
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 14:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB2C24500E;
	Mon, 17 Mar 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP5BRayl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFB6238162;
	Mon, 17 Mar 2025 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223069; cv=none; b=ng8kPw7jA32j0HkAJn1sa5Kw3U8KIFvVwfIbae28yrNzHGgrgWvjHvnsfF+PJ+9+M71jiSkxxaMLnuxFC3IL6NsJ4NmPLrkrrA6zXygF42Z07X0/PMCplEhX4cVzNkhLq4nzq71S2UESry2jgA/4gpd1aalyy74TZP/TAlSZcHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223069; c=relaxed/simple;
	bh=Ei0Jo7GbHU+6on5aqWGAf/sd939nMlfrbpwJvZ+8jbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7ZmN+7U/T/z7bL1d0Au9iD1cIBjiiVNEZ7akHrrotMrfThgxeWxBqAue3Ac+TJGIwfA054lrRua/f10X4tPFV+QeYODSKed0Y7fNW50TJh6BA2VE6LkyHK1P/K5DhjHzla0cIW+qUFE8190ALKjbICYRjkrvt0mUzuoUiI2IyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP5BRayl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BB1C4CEEF;
	Mon, 17 Mar 2025 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742223068;
	bh=Ei0Jo7GbHU+6on5aqWGAf/sd939nMlfrbpwJvZ+8jbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FP5BRaylpuMtaVF8ETJpc2PPX6jd3d2scnLFJf/Vvdzjjmqq2U4NhVaMKi5VWCh2J
	 cIM+yCUpfSZiowNCXp2W9Te6+F6JDm18/HFL5ITh+xvya9E4ptNlCUXCHZ+BM1S0Kk
	 PiDoAsUgdMR2HX1wSEjbQuk2qw8AOQD3MBV4d5BPKZ9a6Ep0vrGLmf4Y+Rv6K7xdEz
	 MqzUDWQqm0wr8itnhix9aCp8qJDZDwAY36nsmOFsj861mbfuRw1J1nzfND6bVM9Srw
	 O8+bwE00mWbiLuriy/wT1qUEdbY3pr5HuYFP9BQVX5Iijgz4nF2H7LyPc541YJ2kcG
	 mRu81Pk9Kaa2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Joel Stanley <joel@jms.id.au>,
	Sebastian Reichel <sre@kernel.org>,
	Steev Klimaszewski <steev@kali.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] arm64: dts: qcom: x1e80100: enable rtc
Date: Mon, 17 Mar 2025 09:51:05 -0500
Message-ID: <174222306290.1985242.16292518573036609373.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219134118.31017-1-johan+linaro@kernel.org>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Feb 2025 14:41:12 +0100, Johan Hovold wrote:
> This series adds support for utilising the UEFI firmware RTC offset to
> the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
> Elite machines.
> 
> Included is also a patch to switch the Lenovo ThinkPad X13s over to
> using the UEFI offset.
> 
> [...]

Applied, thanks!

[5/6] arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
      commit: 409803681a55e061f5ea6be82f05f14c0b9c707e
[6/6] arm64: dts: qcom: x1e80100: enable rtc
      commit: b53c2c23d3c2e50473c0be17a392d4b03a296b52

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

