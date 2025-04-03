Return-Path: <linux-rtc+bounces-3736-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDCEA79F0A
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051053B5FB8
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9901248893;
	Thu,  3 Apr 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zup1W2ke"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3282459FC
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670753; cv=none; b=IusI3YGapEDMXE02Hmu/UMxaq4cxcpkvs1bR6DHivDbHCPNCCDbzatxk+OhaOKn2vykYdq2R+p4bn22ujkZIoFxggHM/wJb1LAw3/aIr9mL1jT0i7W7kh5uQ22RuW/xEAhlQHe4UVFw09xl8CnpKa9z/4gdzOJiNiRo7A/Dd28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670753; c=relaxed/simple;
	bh=l1zcOTqbAXM+6Af1i6qiSSUmTQ2DiJduP75aVq1nYPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZxJDh02meXUmBGzCHya5xoqiCQlFs2k5dNlxqLM7zidiqVsRV+QprBkBxUFDZCN53/cGCpwszDd+Y9pwl/F8eBAqWTGQ2eIz0X5Z120XB69RqTAwqndubsbh84wVqkL8At2aRQRdt/C0x8f1xigB4wz1fEC5JyQj1yMRl9ql1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zup1W2ke; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so88024966b.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670747; x=1744275547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=Zup1W2keMOnRI00TDDGp9mzIxTwY5O5DJoUCbFSCkkuvmr2PJ10IN1u5wCZI/LZP48
         UErPPHbYO/NFzKIdomHCR+0WMJxAizOMefapfK9LnLRD3ZI+l4Y9VaRMUHUXG47P6gJX
         OXXMMSAXEZh/JPi1KQIQtgmXxowJnIQ8nznrnSMa9wdsnWyweOs7lh8F+H9+fQAAYvOl
         OY1ComBPd7d2ovpwHZWuxb/xQ2NP5owvqHI0JBvymSG2oSlhf1txnGdj5ROmr1Ie7mej
         0amnOK8Ut4NyC/igZJfAxS52hFp9Ge5BF1iFzdJp6SfM3pqr8vOk1Hbi7TBWNEMy5aU4
         Mwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670747; x=1744275547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=TgtbCIfhoiD7lCsaFiJdlEt96lWOVtWbpSdmfXHFM4VJMJTmrIQO9J8M9YKpMa8fbv
         7L6YEvHn6sQlP0e0LRiaFILpjrXih2x7eX5bl8KDvf/B7lTWgYZjd+c2X0nJgNpNPqbF
         jPm4Zg6x679yVxeCzd9Q5iWzpOc/pQGTjgM6vXXsfoQ47Jw0V0tD7HZCMFugZFulpYVt
         1zR3SGu6srrLU41hznPs+kkSNpLfNTf9kMUsC+Ia16RYG6F8lw2TMnmQOHbHiSvn56NW
         ZJuIIZW041BckQ4HRKA6N0bkn4k9n85k41zaRlL5Fh4TRIKsw7xn6Ss7H6LP0pSHpw9a
         wwaw==
X-Forwarded-Encrypted: i=1; AJvYcCVG0f4VbbWJbSbM/LSDMizwpDvAFU85mLct+qzQPB5MNAmDU/Dfppc2fOrTWYTHotLzrzJqblQ1Zug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGiH0AfIQl2zjokmRiFuwGI/shH5uqsS0Z7wFjXj14yCZ3XJ26
	6jfAbmVhfO4G1xguzsWr3F6DYYTLH0G3hiiGhZhSic9ecnB/D36SpzFcDhJt9bU=
X-Gm-Gg: ASbGncvHMqaB2vGXXm9251ontXPqKCRHmEfm+W9QlaTUtdBXnijAmDpiH1I/P+n5wxm
	ng9BEmtbJAhG3kgslRE/5vAv5Y3Z/wT8CfyUlXQZWFUKqWBe0Kxzb5eUpBJN7l8GMQrgCNzrbo+
	7+S2uM7mCGdPT8XIuLSE0W9gIh8zWlXujrK92JDaCM81tGbzkCPxnTcf/Mjvu/KfCtRPfANo+xw
	oRurmfPRSopMw5ZAgW+7k66y3MoRCaE8oCCQmdOI0S7rrKju26KmtBLtVZdja6vYCa8xJ9hmOt3
	fHw4She7X3cT2FVh9aatZLTaVmFX0i/uiHWOw+Jk3CrZAV/TooUqXDzTW+vOUWUyWMY2xbjckHB
	0Q9ls4nqZQirmlNOTlz1qfh6fTv/z
X-Google-Smtp-Source: AGHT+IFNqZWOvo+Tv4vLHdGRFBjU8kF7IIgTkc+Bnj5l7bb5nmPkogO1xX8561qZ+CITxdN2Zb0Cyg==
X-Received: by 2002:a17:907:9710:b0:ac2:cf0b:b806 with SMTP id a640c23a62f3a-ac7bc26ec1cmr186829666b.56.1743670747337;
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:03 +0100
Subject: [PATCH v3 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-11-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog


