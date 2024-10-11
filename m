Return-Path: <linux-rtc+bounces-2170-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E499A798
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 17:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A981C25061
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D539195FE5;
	Fri, 11 Oct 2024 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="eTAHlZHK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA91957E2
	for <linux-rtc@vger.kernel.org>; Fri, 11 Oct 2024 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660454; cv=none; b=dEBU66Bqtph/M6D0SUMe/cn19evk+eHOjQ9tgtsXvB13M/PiE6jbvBL0PeU1Lw3NFL3t7uuzlg0YP9OeF0CI0uVepmHkCIfvMIM3UEfHxydVL6m+5N9u/dgTV2HyUbP+eHibcrjiVQeqBsfevAO77lBlddEs4LEB5Pt4nN7v96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660454; c=relaxed/simple;
	bh=gygbM/0TWbve0yTggoKlMNvknZTLgYXQh0HMHtv9mEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRSX49nHYYR8dLAUbC/4S32OVLU8TL7i0tNCjwvi67nkRgAdcgf0nHVeo0q5FQylF+M6F51zMLOELMbxigNjMNM0wRuyLebHZczGAa6imdiaGLVm6fivLUEGCHqje9s25Ws+WHic4kwpzFOTxdMAfArjg3H84NBBChiHpclTPKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=eTAHlZHK; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7ac83a98e5eso183605985a.0
        for <linux-rtc@vger.kernel.org>; Fri, 11 Oct 2024 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728660452; x=1729265252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NvbtWswNjmMVigXav8simFFQPZnS0nT4PzjzHauoQI=;
        b=eTAHlZHKgXdhvHPRoUscEYmUQlokGEzIl1MhqslOrWmVCcPIPKF+f97VN1EXHS66mB
         BT++1EeDmZKMG/Fpfim9OM/Z7cfxxkyF8PjGa3myr7uqlpEWsFyGEcwcWplwk0umc5Tr
         MFoYnH5/TUplB/PomtefmpZ/vghoAkSizrfcWI6ssi6MYfSTMLMejqjU7MdadHz2CpSc
         4hvnFx9eRNHg8+zRcXO+lHYkR9GrjXBTfDir/EhqCpzLJ4NpZmBUVi9qFywv6dGkBzzZ
         BCIPmXY+A+e6nE9RfoLTou4IkcygjYxB4bNOO4P5PR9aHRKsm9/y8MXpjruHeHdoVx6G
         A1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660452; x=1729265252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NvbtWswNjmMVigXav8simFFQPZnS0nT4PzjzHauoQI=;
        b=oKzwP1RcOH7sVOgGuT88n3Sw1JaodCEn0soADuT5Qs1TrLzj8BXGbrDRTS0z6SJg8T
         s06lOj1a0ktPU/Tmq9ooMx8xskeWuIQw0GIx+3K9ISVDiVCdaihsNoNq+NzCKLy8Ro2R
         aHsnBISXmVk92uf7/VgdMnVHwlars17ltJuzAA0WzN32qYUrXLEKUhMQimP0NO6YAPNe
         wRf+Yy1tM1lidj+2up+bW+iPH7dlfcP+0pMkTUg0tjztmFqwWiRjgwapjOr4LhMcxNqA
         piGYXzjhW6FcUyaqiBsG5AbkthQ0p2lV3mG0wNAwTAgLKymBBAapYbYU2R7QzmcG4yPl
         3tig==
X-Forwarded-Encrypted: i=1; AJvYcCXHAhZ59e8dU9L8jsHCf1W4wmRMUa9i2pDyXtds3M4srqF90ZjVOqlDoopQINyO72IuqSF5YINXjsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX9mg9yD5CXnVNuqGTKdyucYQQjV0QAEGM2v+TRpHqdFHLIM9W
	r3ejFBH1VGJZsXh6wg+cxHxrF8X/4DfkNny854BYafAji4IYAJ9eFJbM1Ax0tcNAHUFf8TmynWx
	4bm0=
X-Google-Smtp-Source: AGHT+IEuUyr47HQ77Dj6rHURBePuo97R3GxYp5l2VR2BBG5BruZx4SafyF/ZWlHT/YwBEzdpqhA3lw==
X-Received: by 2002:a05:620a:46a5:b0:7af:cea2:75f1 with SMTP id af79cd13be357-7b11a3b5c47mr518993285a.24.1728660451832;
        Fri, 11 Oct 2024 08:27:31 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d5220sm16344131cf.32.2024.10.11.08.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:27:31 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] dt-bindings: rtc: qcom-pm8xxx: document no-alarm flag
Date: Fri, 11 Oct 2024 11:22:40 -0400
Message-ID: <20241011152244.31267-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241011152244.31267-1-jonathan@marek.ca>
References: <20241011152244.31267-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
Thus writing to RTC alarm registers and receiving alarm interrupts is not
possible.

Add a no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index d274bb7a534b5..210f76a819e90 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -40,6 +40,11 @@ properties:
     description:
       Indicates that the setting of RTC time is allowed by the host CPU.
 
+  no-alarm:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that RTC alarm is not owned by HLOS (Linux).
+
   nvmem-cells:
     items:
       - description:
-- 
2.45.1


