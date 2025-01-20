Return-Path: <linux-rtc+bounces-2959-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C31A16E9F
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA0041644E0
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4C01E47DA;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njpLeZIF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4B81E47A9;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384168; cv=none; b=aD6p0JAymuWgejJs7Ab+wf/9i3NFUcVKEWRV4oVOQeDL4b6NTcXM67Ib9gvJB67PAgLjRm3RIC5quIQ7fLUNuSym0RHZxyMWvFqjl8WXpMC85q1O6FROL1LVrFkrdKc42/JqSWOwFZEPFzrW6JMKL6Pu/ChSo3POPGDtL/KVJKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384168; c=relaxed/simple;
	bh=g5B8wRzRuC7nVNYrPG6OJobEDMTyTs0Bs77db0cnHP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJaz6L0186dji1ze+vUGjfSBqLqMo0adGmxmHRIwd44jd1viEdy1MtPRbn10j5vFz/FW2HDwdvhlxBtP83VQIpq9e1HjEXy6hA+VDHEI2I1nmCPCh8cdGz/ZcH35ptdjOZFQciqQhuda0jV234TbKkMvjRWWHNjfhyrs9tZ6wHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njpLeZIF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8362C4CEEF;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384167;
	bh=g5B8wRzRuC7nVNYrPG6OJobEDMTyTs0Bs77db0cnHP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=njpLeZIF07oARHvgJqP5MnDDJBOPXMlJyzQdQsqnQaqQQSkqYJk/cGLqSyq+NSaKs
	 WUG/RO1YgX40wJ/NZWsXe0U/E8FDTBxO7p1ZuiDY3t0GFdoCXz90MNQ76oemWhUEvj
	 3kgCCFHcHmMG3psXbw83fcQnq44dd8i++fg6QUezKzmZGkS6pro9axfDlI0cmrA9D6
	 2vH5SEbXeeOCWtf8RVSqT7tazmLDytuEZB7N+iRUN7DwUCwv5WU7Ze1Va3CufzRWkJ
	 q1D6Q7DZTedegahgNKwyL1s0Uo7K+n/ozY7nJSPDbvOHPks43Kw7dMpvOkhtixNmGt
	 O5K5jjBve0dJw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZszL-00000000380-1V5x;
	Mon, 20 Jan 2025 15:42:51 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/7] dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
Date: Mon, 20 Jan 2025 15:41:47 +0100
Message-ID: <20250120144152.11949-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250120144152.11949-1-johan+linaro@kernel.org>
References: <20250120144152.11949-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Marek <jonathan@marek.ca>

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a qcom,no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Link: https://lore.kernel.org/r/20241015004945.3676-3-jonathan@marek.ca
[ johan: move vendor property; use boolean; reword description ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index cdc56dfbfac3..7497dc3ac5b2 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -50,6 +50,11 @@ properties:
     items:
       - const: offset
 
+  qcom,no-alarm:
+    type: boolean
+    description:
+      RTC alarm is not owned by the OS
+
   qcom,uefi-rtc-info:
     type: boolean
     description:
-- 
2.45.2


