Return-Path: <linux-rtc+bounces-3234-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC18A3C06C
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C3CC16DE9E
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D6E1F239B;
	Wed, 19 Feb 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWJzavO3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3541F130C;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972598; cv=none; b=h/vwF6V6paUu0iYTzwAiPNfzm8hAaLICzi4/XXjFEb9pRuuW7l0CVRHBuxLt0xt6vxl96hjTD4n8BsCg3p4ZhOS7jp+oc/rIPLFGWC7li6A30XAKUVUG1EQOzEJv9eOnbE4x4NG6eBA94kqEfUps/72fCC5MnbjuLjxg7Tom4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972598; c=relaxed/simple;
	bh=TXZhVpYKgO10ZCx7g7qCUdIYO/DTpFUKjvq9lXUUZqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWz2bUF9WjHQU2DCJWcdlwKErrLQJ7Zt8fu7EbCww2d/Hc4kpkYq+HZ/JIukZOG2PeIL44OA4EKH7DmHhSFj4grDXAt08WaptAbnAq/TbW7XG7zqHYtSMlXf8e/GmNC1YGmNtckjyX6W2pzWnX79dWkqFQQeGX01Mme1hWj/a/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWJzavO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A66C4CED1;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972597;
	bh=TXZhVpYKgO10ZCx7g7qCUdIYO/DTpFUKjvq9lXUUZqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWJzavO3+oOZWuEasl4/8m7aTr+4LSnSIQf8z+3NXVJXF2Cy+R+djX/U0geUS7IOs
	 uErfK+ehMpkYMVCnwyxyRidrMlGf8274ow7wKalpUIaNqa/JniqayV3u9jgIUA3e2f
	 IAgV0cocm1vbv/+8zve4N3F9NfwJQJmUHp4HicJnrsPnncVLsjo6AvoRzCu7kpMI7D
	 cjIgRLP5goqNQ6K6H08f54Eapb4xretT71O+E14b0ibRDi4EfOu/IE8AZNph19WO6O
	 EIvy6NIO0UOgKuz1qiAS9SOy0DImXfw1bhic6PiZpCIHdsvQ/c4erKCsFZBrneZ5o3
	 U/8cA5suQOq9g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkkMI-0000000086k-26QM;
	Wed, 19 Feb 2025 14:43:26 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
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
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: x1e80100: enable rtc
Date: Wed, 19 Feb 2025 14:41:18 +0100
Message-ID: <20250219134118.31017-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250219134118.31017-1-johan+linaro@kernel.org>
References: <20250219134118.31017-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On many Qualcomm platforms the PMIC RTC control and time registers are
read-only so that the RTC time can not be updated. Instead an offset
needs be stored in some machine-specific non-volatile memory, which a
driver can take into account.

On X1E based Windows on Arm machines the offset is stored in a Qualcomm
specific UEFI variable.

Unlike on previous platforms the alarm registers are also unaccessible
on X1E as they are owned by the ADSP.

Assume all X1E machines use similar firmware and enable the RTC in the
PMIC dtsi for now.

Based on a patch by Jonathan Marek. [1]

Link: https://lore.kernel.org/r/20241015004945.3676-4-jonathan@marek.ca # [1]
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Sebastian Reichel <sre@kernel.org> # Lenovo T14s Gen6
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index d7a2a2b8fc6c..a59aa8e7642d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -223,8 +223,7 @@ pmk8550_rtc: rtc@6100 {
 			reg = <0x6100>, <0x6200>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
-			/* Not yet sure what blocks access */
-			status = "reserved";
+			qcom,no-alarm; /* alarm owned by ADSP */
 		};
 
 		pmk8550_sdam_2: nvram@7100 {
-- 
2.45.3


