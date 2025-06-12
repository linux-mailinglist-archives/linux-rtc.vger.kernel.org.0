Return-Path: <linux-rtc+bounces-4288-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93492AD6665
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Jun 2025 06:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB4E93AD89B
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Jun 2025 04:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABF91EEA28;
	Thu, 12 Jun 2025 04:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlx6IgF4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091441EB1AC;
	Thu, 12 Jun 2025 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700857; cv=none; b=eFtFXgRPn1TcIDqmqlfXktI5PhgHHi+MsUZxcYjcpTWHkDmpiBJKv4Q/0XJTNbmfD4ZugcbhHLWNSo3uRP0cBWdsVdjCO0jCIefsr9hw9xn7I4OSzd/XxK12nZsXg2j2RF92wl/GKpcccLZ8TNRZmJVYnU44/Ua/Xk0Bc9aVDDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700857; c=relaxed/simple;
	bh=OpmxcJf3h/2HttpcO0XmNeXRlJGLjNMHiTMpiBSTrJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Li7OnK9Nx/0R7y7y+QYrIfO/pMZbSIrfu1MgNWlW+cAfG94bXjdqpIJ+61N2we2lSk5x9edt6LRbVXUNK1sSRlOIcwj65I0dH6RzZfmIt3C+L/2lkNkgrHlm3we8o1lT85/BeCCs3bx4urnLzmJa50SNO3OQ/JiilgQZyWFDpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlx6IgF4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C87C4CEF5;
	Thu, 12 Jun 2025 04:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700856;
	bh=OpmxcJf3h/2HttpcO0XmNeXRlJGLjNMHiTMpiBSTrJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dlx6IgF46612aUVnEfBVFTQPPmD8VEqPeJ0TEVqMc8qnZfSmYMbBSzMXAFiZbirpv
	 l/1uT3PFLIVdM0eKjqIUQmoOOQjftfkIDVornPiJDtE8K4WrRzi2XE1RgyRgDhrfgc
	 KVUMselPjGnNJBH04SEn8VamMjX3JKqwFscukYC/+Qne19ivaLYHC6Jr2JaExZcwOx
	 IVC+kOEmxsTUvbJlAfIzpKyVf+9yDcUsbM+k44i/z+aUxiIlUJoIBWrqTGpfAJa5ZL
	 fFUErPVahkO9S9u3Gj1Ivi0gkqxH43OuxlPsQkn93TFmStnHApiYBqPKjuhmfdO5f9
	 lKFWhfWb26eNg==
From: Bjorn Andersson <andersson@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] rtc: pm8xxx: fix uefi offset lookup
Date: Wed, 11 Jun 2025 23:00:36 -0500
Message-ID: <174970084180.547582.16657284509599541247.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423075143.11157-1-johan+linaro@kernel.org>
References: <20250423075143.11157-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 09:51:39 +0200, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> On platforms where the offset is stored in a Qualcomm specific UEFI
> variable the variables are also accessed in a non-standard way, which
> means that the OS cannot assume that the variable service is available
> by the time the driver probes.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
      commit: 869971de8221b97acb6aa4d7ff4fa67eb71adc87
[4/4] arm64: dts: qcom: x1e80100: describe uefi rtc offset
      commit: e8d3dc45f2d3b0fea089e0e6e351d1287a5a2a29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

