Return-Path: <linux-rtc+bounces-3231-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A552A3C040
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9B77188EA47
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741711EC018;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLSRBOMn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9E1EB19A;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972597; cv=none; b=iGlMYK0ewS4VUrwI7/MGUelZyWbrqUTAFTk21qQIBtSKnJRE9kZPEbbfe4FpdveaAzj6dCh8E4P5gbX3iwuHymDOKB9chwQhSFnhYF7q68RplJVy4CNVo7mglshlYQg5qcB9OXNo9g293u+Z6CLfx6gwGC+rNXwJFgnA2UyPj3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972597; c=relaxed/simple;
	bh=oiRjy3yU3iR8pNoPEhJPyx535ffRUMg7nWD73L8N/VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xr5dBGPFCWNeBdrEBeyvEjv+oVcrIaiCm+NqYdqA7gdYUhelKwjDzdla4e8AXMb9F+E1b6VAITpBSZY3uTJzg93Y8QA6bDIE2PShJeOIF1o21ThVlFKouhFORu5sxsWXkMwp6USacqe7Ez/VowxduavsG6PmKgR4GjqJ8cFb6mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLSRBOMn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B17C4CEE8;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972596;
	bh=oiRjy3yU3iR8pNoPEhJPyx535ffRUMg7nWD73L8N/VY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLSRBOMnuNXWMpdqe0Xn5B0WSNE9dVrYu0EOAmohcv1IdHPlvRjciBeaED+v6oPmB
	 v1ToO7nVkYcxmCOrOAndVyyh78gDHOjsLT4nVumTjnUTLXIP1ZAoTEfMqW/Vu/8mHJ
	 nb/Fl7tAKcMQjTZFcBqA4VFExerFYcar4N37c2EhMWocW/od80Xn8qeOhqtsx4+G9I
	 +1VPbdXj4HocGKQ6qcDQdRWHAs90iMY8m4WWzmgOpxMJK7qWBw6tTdttcdQ6lsloGR
	 dvkieQagK4oMeHT4G6Zl38+05qjSzvPR5Z5xIjxDADsYdGYHz+l0QPGRiuN6Pm9/O8
	 3mrNQenSSqFvA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkkMI-0000000086Y-04Kt;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
Date: Wed, 19 Feb 2025 14:41:13 +0100
Message-ID: <20250219134118.31017-2-johan+linaro@kernel.org>
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

From: Jonathan Marek <jonathan@marek.ca>

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a qcom,no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Link: https://lore.kernel.org/r/20241015004945.3676-3-jonathan@marek.ca
[ johan: move vendor property; use boolean; reword description ]
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index d274bb7a534b..68ef3208c886 100644
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
   wakeup-source: true
 
 required:
-- 
2.45.3


