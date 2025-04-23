Return-Path: <linux-rtc+bounces-3978-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E70A981C9
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 09:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF988189AC65
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 07:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9062B26F469;
	Wed, 23 Apr 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJgexmis"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4207E26D4FB;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394841; cv=none; b=ADFLIyUa50bJ1UtgrbBSm6T6RLtR+H6UcSEaSA8OvewJ7MhCFy6b3tbVHFDmEgVbRZqM48pZof8X1in0X4kWdhXwaSRyXQo7XtrmzxW6l5GgHALul+9Bxb3HRyRlVI1sS87Uj8NqTlp30uBMa66LmQ0j3KoM8Y4Py2BalAGSBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394841; c=relaxed/simple;
	bh=Ukky07QaiK/F5NoV7jqIANfFkmUJy5PKAuULzk2Aq+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEDUzoDQtnc21K6cKoPVDFF2a9SBREb+oaoIbV2h4tPYSeoUkb32rWEf8s1vBlJnnA0gcDRcn7YN05+FTWx0FdLhR2eGt41n+zzzqWuv8Pf9evcbkDBuCfK2jNd1i1KTdFJK2qqjOJal3ZUZnIqmsxRTykXNm7c6cuKOLLCDTDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJgexmis; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13E1C4AF09;
	Wed, 23 Apr 2025 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394840;
	bh=Ukky07QaiK/F5NoV7jqIANfFkmUJy5PKAuULzk2Aq+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJgexmislfGDHY8SCZBzo52qn9W6DZqU50ME4zPgsTc151AE5OkQ3CvDAxEEYqDnK
	 JUWww1MO8MMw+infSBZFnX4XOT07dDr11pRfTPuQJ7/+34pkYbgB8j31Dx+lsdby8S
	 QcXkKQ446gHcPykLiuxRLTgLww7UncJQ4R/rBE8RjTBAvbnGVhcLs11eE7mrAJ6LuM
	 uE6Yavch5ZbCFIuGg9NfWxTx3hbBDQ/yUhZxdpiY5tpEBaXgw/iCifw7jNkHLnzHyc
	 sHlIzXRshIPD7iZi2xVSJ/Gq+N1Nz6Nia3ZpBdaPno5n1dEe9yegll1EI2MK2K8JWY
	 EVF/xe5cLduYg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Uvf-000000002xD-1Ysi;
	Wed, 23 Apr 2025 09:53:59 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/4] dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
Date: Wed, 23 Apr 2025 09:51:40 +0200
Message-ID: <20250423075143.11157-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423075143.11157-1-johan+linaro@kernel.org>
References: <20250423075143.11157-1-johan+linaro@kernel.org>
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

On platforms where the offset is stored in a Qualcomm specific UEFI
variable the variables are also accessed in a non-standard way, which
means that the OS cannot assume that the variable service is available
by the time the RTC driver probes.

Add a 'qcom,uefi-rtc-info' boolean flag to indicate that the RTC offset
is stored in a Qualcomm specific UEFI variable so that the OS can
determine whether to wait for it to become available.

The UEFI variable is

	882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo

and holds a 12-byte structure where the first four bytes is a GPS time
offset in little-endian byte order.

Link: https://lore.kernel.org/all/aAecIkgmTTlThKEZ@hovoldconsulting.com/
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 68ef3208c886..7497dc3ac5b2 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -55,6 +55,12 @@ properties:
     description:
       RTC alarm is not owned by the OS
 
+  qcom,uefi-rtc-info:
+    type: boolean
+    description:
+      RTC offset is stored as a four-byte GPS time offset in a 12-byte UEFI
+      variable 882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo
+
   wakeup-source: true
 
 required:
-- 
2.49.0


