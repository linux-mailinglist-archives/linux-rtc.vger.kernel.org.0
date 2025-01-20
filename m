Return-Path: <linux-rtc+bounces-2953-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27883A16E94
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 15:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 138567A149E
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 14:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C7F1E3DE6;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Le4/dz2l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081371E3DD0;
	Mon, 20 Jan 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384168; cv=none; b=mNlZUk2RgDcdDwfpNgkaUZQXx1yXctA9xt3dXtos5mNgr7pUGrBXJ5BWyGWTKZD89Lkoa26FdfT/GKmKgB2jzSgHfiInsjt0VTM8ISXezAOhl1Kw2OrFLRpK5EMjxIcip/niNWFaqKhb7AKjOpxm7DFOZ5+bCawikTO3w8oNNNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384168; c=relaxed/simple;
	bh=cCCt1z+IEVRiJ6ejCa09m6Lrq4Wa209py8lnf/4l9FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1RMHk2Y+ID/raI2WjhrXqj5XtXxLIukrJoWG3pbQC3aGCRx/pKKXrlAV5BJena+aAxCawCJjoeGEzNActv2bsqNLoJ1AhsD/HXS3hJMyh8eJ8DDK0LWmDJkmSpb7cTjGn9tGDv7rk7XdsTtWlrUMBoXMyqPjcspSC4qp6gSzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Le4/dz2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7628C4CEEE;
	Mon, 20 Jan 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737384167;
	bh=cCCt1z+IEVRiJ6ejCa09m6Lrq4Wa209py8lnf/4l9FA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Le4/dz2lKiWMpjyEdkCBAkbWxKiYkfgM7DKUMerpT3NDXHZPzf17MgFWLwwlUJACa
	 uLDjqRETRIEsiMXV6QezyXrGesjhl+Os3d+RQui2zTae0BgP+v1fDqRVxRMi/pUZlW
	 NuxdrN3nhilGdMW+TBBwwuPCFFAl/HH5lrzl1VNSeTp2TTdjiBihC9RtOL2A1ULKyC
	 PbAPy+QkQNpVzNAjwSbzZ5SOSoT3ZPv2y45j83vX3pyNx5LLwKwmadZny9d54qoBTR
	 BqjofOdiBkkqslTAQxVaKT7AwaYYYHfZkhcLc4x7IEGJ/7m+CCTVO3YC5+CwHUDzPQ
	 vBnlvWdZCo/oA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZszL-0000000037y-1AVS;
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
Subject: [PATCH 1/7] dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
Date: Mon, 20 Jan 2025 15:41:46 +0100
Message-ID: <20250120144152.11949-2-johan+linaro@kernel.org>
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

On many Qualcomm platforms the PMIC RTC control and time registers are
read-only so that the RTC time can not be updated. Instead an offset
needs be stored in some machine-specific non-volatile memory, which a
driver can take into account.

Add a 'qcom,uefi-rtc-info' boolean flag which indicates that the RTC
offset is stored in a Qualcomm specific UEFI variable so that the RTC
time can be updated on such platforms.

The UEFI variable is

	882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo

and holds a 12-byte structure where the first four bytes is a GPS time
offset in little-endian byte order.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index d274bb7a534b..cdc56dfbfac3 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -50,6 +50,12 @@ properties:
     items:
       - const: offset
 
+  qcom,uefi-rtc-info:
+    type: boolean
+    description:
+      RTC offset is stored as a four-byte GPS time offset in a 12-byte UEFI
+      variable 882f8c2b-9646-435f-8de5-f208ff80c1bd-RTCInfo
+
   wakeup-source: true
 
 required:
-- 
2.45.2


