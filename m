Return-Path: <linux-rtc+bounces-3699-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3ADA74B75
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94FE917D9DF
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7D623AE96;
	Fri, 28 Mar 2025 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/iO0eQz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A471C236A7B
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168687; cv=none; b=G0yH11L8KNlwDKpRmtH/n5Zu7xDXKyiPMfUrzqY4S0J2Rrc9OWCFtD552BMYOQwud61iiQxpaV60LjV6WL9Zzxsj8pNu4yoQj4R1TexQcXni3Jfp0nxC9hfwsl176n6YrF3WwUbXEOxlEUuwm33wfS39J2nCnwsXUDB6DHYIoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168687; c=relaxed/simple;
	bh=+fAAJ/+/3MbgFo3bOsjQzn5S6tmp2xnmlCT4juP9rJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARsgMQEJkVVRRPJpbdNGL0Tu6xpM2f00oBv9nTOB4ysto88NAz1Eu4TNKfTeCrAw32jAm/enxsEZmK678GW8Kw4iA5R1xowFej/hAN3HtDBRhf4sZs8clCDtyiLTVrBJRg2mFI2JAKQJJDYgP/oJZBzxJMwfS8gL++7Ho2aD6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/iO0eQz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so4132345a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168672; x=1743773472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=V/iO0eQzruQNTb/ePvh+rTGZTFLnQ1j/Rvzv3/soUPGBCGQyGNzKYMi3ZhiUrva6R0
         IvQWL6uH7aOKzByBc6ZyQV4oq4RwY8gd+Hb0n3V+YP+PxWioMAuDjkeRHBboWDpE7ikI
         6SxcHF17osyWDZFwe/QkswRazPPTzc401lE6ux2bTb2Vgb+tFlvLte9/xW3zBMxbQ3m7
         vXlZDlc/MSwyvFKFVmG7aDmZ1bHArFGNL1l1q2plqkza7Bu8OQaOH1LXGL20l/Wird+d
         mitURmgOgzv5yneBA9ED0HGWiwf4r3T5JPaP9KwOVsUpryTaqX+W/acJ3GQUe6TzSfpS
         FtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168672; x=1743773472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=fkbOJbwKp3cCYaphZWZjwAR2kikk2OoVMMj1NWruuupSwuqqeS9H4Uz5JcIxl0tk3x
         HBkEPp1HHp6kReWI82nH0YyqnPLrIj59ltEylj4jjR3pk4VxFlFdnmRfp5ME9E9Busbf
         /k9r8LKQWrMAi1XORAmVM6vFXDaAEqioqmN4k/0np1gaotMvJQHRYfJcO+jmFSqLIFfy
         HSZB6jc7cKhSlLwj9qwLfHKWVb7MhCKlwdy49qIJwrxKvzr5XZX3NFIHFtWfa28k1Zo0
         ZScywBXbCdjTWs9IjmHAvIFj0IFONrQzrintOUtfOCqneId3EYN+cQVgqMWqeqfkAm8s
         +qIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqc0f9yn5bLRqP+MoGpMoFyKFCRiTHkolTxqLbbgnzS0gytIwEDi6jlWWHfvbZANW0Z5PbowRTSCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36hcPEiGpedHk0xQDZJD/3iOjd+O1oqvrcD70LVbYWbCOBHcY
	FI1Qp2GtQgk/Y+Gml7PMSc8yhmQWHtY09T5P4EE3t947E9lRjwn7Mn1NpSZN3ME=
X-Gm-Gg: ASbGncspeR4oJJuGAiB/tB4cuTqmyU2mAbfXbE9/l/uAh1mHbxvy6dBHf/680j00Nox
	eD10fGDkK9wHC1tXQn5niVMxUgEMGNtTcWQymhbUzMqkY8FuV4tgCgJkdM9/dR1Mi3AHwXPvnLy
	R8ATaoyD5VkaPvzN4JlSKDFdtpAOOAn+N+4SZs+YDcSV3K3+ODyzluEiGyVIDtxMzZAUrgD8j52
	qpvmhpPXOa4/DqK29g+BrbY+FGtCBP6/dXRREFi/BlWoan3D0sG5gHXi8gaKszU3rGYJ9wpOsYd
	tfU6PXLBC2XZc0RAvWp0I9DKMxvwvApzQCvUUKU/U4sMuCzFYKxmQG87QOZbV4Is0k3j6IW0dPd
	Skf1QvN6d9tW3RSPWM9Ja9KKnH2Ug
X-Google-Smtp-Source: AGHT+IFcXivfke8CF3Ua6fUT95VkCgqgOsG78wJbvWFT6tJJvWhz2bwcboGbcdFVisEshC8NwxZTJA==
X-Received: by 2002:a05:6402:2547:b0:5ed:3228:cfee with SMTP id 4fb4d7f45d1cf-5ed8be108a2mr7864450a12.0.1743168671175;
        Fri, 28 Mar 2025 06:31:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:18 +0000
Subject: [PATCH v2 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-32-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.472.ge94155a9ec-goog


