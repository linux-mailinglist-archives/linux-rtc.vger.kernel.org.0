Return-Path: <linux-rtc+bounces-2189-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785999DAEB
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 02:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 146021F232D3
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 00:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0011C13665B;
	Tue, 15 Oct 2024 00:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="dWGElcM0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B804964E
	for <linux-rtc@vger.kernel.org>; Tue, 15 Oct 2024 00:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728953606; cv=none; b=nnXU6uxwyMFum/k60/jnz8/NvJMWrckhHZkuwDGNZK4pUtvhcZOfnZJ4j4PMWDBtP0ofce9RCvpFpnDVZedPNMhkXZff8WZ4g15N9YK1S/qQSmPpYRyN5sDUqcXjYbdSpSxIH3r7Vv6mpACKWtZ6doWfCSeRMgbv0N/XbBNup/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728953606; c=relaxed/simple;
	bh=dvNjYFdkB9YBWF1uKqg2XE7SQj8DOkKacGpixglHlcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+xAGHv1PL1ZjnYu7jw6ArNSiDQYqcp3u1ycPTIMH00PLbHme95C9uGqCS7vAOtXdpOE85B9XBo+kY/WRe9oGd2F5VogQjjgaFPlDAUrAUD4Qb4rzL9SXb0k32rOr9tCw5JmnDREQFbgXzqkwE4CmmJ8xntZgGROHZB06RV0lDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=dWGElcM0; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b111535924so400155685a.2
        for <linux-rtc@vger.kernel.org>; Mon, 14 Oct 2024 17:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728953604; x=1729558404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uda+QHOh70dpYmmcKG6PZmo8FX69gZoytF2iY+WgOps=;
        b=dWGElcM0hTAPHWsUseKmLqyWJSaJS3/A9VnvaLekSMmhCpLwZ/fEfIABHws2+mhBu5
         JOvml0jg4Se0MGB/L8JTFiQHBCVjzXNJOq68M3XFudx/eQ3DSqJ7jXC/x61wbYf5caAc
         dO+HLaQKQH6d+vqym6KMVBHEngAmvt9ZDc0R4xaojbvcxQJZfel0WVF4O8pZfkCWcT9Z
         5ZOkkS8oLr0cKlsZZZrjDlT0q/6G2mdQ2vyXACgLrnmNs4TEchBj1+K2DS4ovWBs1dUb
         ty2Rd/ktQ/P0CBLLbccSHCOZcwYPjJZmRsKr6Dl7GEGSvHddnAShe4jqeUh4kR/1ARqP
         Ceew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728953604; x=1729558404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uda+QHOh70dpYmmcKG6PZmo8FX69gZoytF2iY+WgOps=;
        b=KFtNtJbhO49y2pwXJlKFFb5tJFdRC57wTrn+pJ7UdBOBc/vSw+e2/MYW4tw+HtcLYB
         5KUaULB4aac5UEBLGNxEeplCbYoP/U5bGh8ZZ1CkFcWUASPBicGpIMjs27+Zqj6Rj41G
         4m0bmsay++9s/7GMLWdKmXMhM5t5Q2EbVQacNg0dFiaT884N+mnxRvQHU8hMqar+hUBA
         LCEyfe/bJshlTLtz5dVrofsqS0wOkPqZTd9ybuA2e1b0IwpXJynwVBw56p3Bn5MgX/of
         RYTvwK1dVz6Dbp58BfgfgUzNVimP9bfKcAu2NnMdTacIwkyc5t/atdwsv9YEyIY+5Ljd
         zSPw==
X-Forwarded-Encrypted: i=1; AJvYcCVX037m800adllKtd6k9lExfBtn8WRMhOPHgM4sgZONn9HI6EOyRb1F0JBWN2b7gJCkpBUpo9Is3Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXyz3RwyGSJjtzbi/kaK6bxlKMvK/eMFeoszTGvNNZSh+uT57X
	X2a8phV+lVt8ooBetnf2dptkg6+UaH8BIlxOgOcmvacWreHIHb6YujdbtMz7GGI=
X-Google-Smtp-Source: AGHT+IGujS0YltsUyvVwBJrnueAylsfkK9nEY0qY3I5hzXRc4d5fo+ZlRzW83dHau6iTWTFjwpcg7A==
X-Received: by 2002:a05:6214:46a0:b0:6cb:e452:2cee with SMTP id 6a1803df08f44-6cbf0074708mr283404276d6.23.1728953604437;
        Mon, 14 Oct 2024 17:53:24 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22910f0bsm1213956d6.16.2024.10.14.17.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 17:53:24 -0700 (PDT)
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
Subject: [PATCH v3 2/5] dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
Date: Mon, 14 Oct 2024 20:47:27 -0400
Message-ID: <20241015004945.3676-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241015004945.3676-1-jonathan@marek.ca>
References: <20241015004945.3676-1-jonathan@marek.ca>
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

Add a qcom,no-alarm flag to support RTC on this platform.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index d274bb7a534b5..23a5316efadba 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -40,6 +40,11 @@ properties:
     description:
       Indicates that the setting of RTC time is allowed by the host CPU.
 
+  qcom,no-alarm:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that RTC alarm is not owned by HLOS (Linux).
+
   nvmem-cells:
     items:
       - description:
-- 
2.45.1


