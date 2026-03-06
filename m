Return-Path: <linux-rtc+bounces-6142-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hFcgKLraqmk3XwEAu9opvQ
	(envelope-from <linux-rtc+bounces-6142-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 14:46:34 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421222203E
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 14:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F42631A428F
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2026 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E8630BBBC;
	Fri,  6 Mar 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5HWFk3C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885130648C
	for <linux-rtc@vger.kernel.org>; Fri,  6 Mar 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804061; cv=none; b=GIGiO8tJQWnJSXzTHcNYIDOnpENE/cZ6hlCopp8EFI05vawNGiSSTkXkYd4n89svZH0EXOx/KgWOrKWCrl+iKHVsQlaForAcfOJo2XEp3PJ7ljthFHqrQLaD/XuIU2mwRAZRruoSM0xE+N1R5TfMlVTWMYunGKnHPtvewyXv7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804061; c=relaxed/simple;
	bh=NpF8QL91yqldScG2XxQn8+rb+qg1VM07w+yITLk8tqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoV4DS5UaLo/rAPmuYCexKn3vq8yh9puhDDv3PZoBpdmM2nArW0hxWwGNkU33PsXlurK6PRLM+qFg+eNfBJbE4DAOCe4HJ/tzEudK1tSjpaYc2MUiH1njvglrtAnM2DGAnWvxDdcYxMfYxszdKoVL7uQ8MPXyb6qWWBfjbSTH8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5HWFk3C; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806bf39419so75345695e9.1
        for <linux-rtc@vger.kernel.org>; Fri, 06 Mar 2026 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804058; x=1773408858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3xPqNAmdyvkw2Jw1GpTd5bQavc5+xFaOAaBqhAj8JY=;
        b=Y5HWFk3CCMqmVuHog/VIr4ktnP++eh3t4U0FwKw+cbuKqvBcZa7xB+4rv0gMg4bO5u
         OSpnXdecmFDO78ANTaKITRCMxAOQlb4PQnqg+vYIKFleTzUyXmwaJl7p0MIVYxGLZxpW
         EsyDobk/2UUw2kIRfv19NJJk2aWh2Lujc/IKP0K/rqZEqQZKXWYytONl8BEC0m7/P318
         dc7eSRL+9A5qeIvdfSScK/GAtYgKdDctvk8YEWFTYqNADD4dGj0U/HHavYdy03+uce6f
         stp9G4yDvAYtR7CxYk741S7NDMMmKA3UzBKb06gOHRkXERlTtCI39gYeLCUjrqRwjG9n
         RbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804058; x=1773408858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3xPqNAmdyvkw2Jw1GpTd5bQavc5+xFaOAaBqhAj8JY=;
        b=wMe3Cvkns47Q15QjElHxgiSfNEwsMvoq/tk8ulgm/A4x8p+w1Mqf/niPpjcF1RYriX
         Sts60X6omM6cT77++Oq3S/l54BT4mG1hHI9GBW7L0NevJ6Ae1wRzFZNI7smLpbrVt9HN
         tim76zI1/DlQ9vvkKBiqOSEuMwFKMjKopuYU9LRf1zQUEYa5mD8g/X2MU3ptQPP2sxxm
         yhLeicNIAt2YyCIQ8JIbHnGU0OxemxqF0DBQJOTGIuArXCI1j1e5U1EvjJGjLDKhjA2K
         KJ6/7yVuvqZzlqkJdxKMoUgaTPd/xqQp1QDVSReYr2dE/HQX9yNM3exFj+R5vFMMBGRX
         1KDA==
X-Forwarded-Encrypted: i=1; AJvYcCUPEUOdHjELyhc4zxj7IsyRXxK8RZeWO9MhLg86mc0opkQo5gIFmpW4L7F0WGQ6T2agckRAelgzAEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gSTm6yFCO9SzTsDvMA9qHVLiXFViuEYWPkZ8O3Kns70kQfGb
	+i3WCmjqgHWG9b5LRUDdBtNtDwxTzay24wCmQ/5+CJaDGTKWsgcLizcw
X-Gm-Gg: ATEYQzxeey8R16DUXeS6lxVquEMLURVEYxmxNw8QEOMN1oXX3TrtcXIxKqYj1KBRAZf
	RXeLC60s6JqGaN2Bq4dBo2R5mvoCJvdkdm4WkEsovTW9jnt9TURHJvV9KDd/UZk1FNCPZvBZHKF
	D+FDNBYpWc4eaFFEMRsUsT20PRilqttgKVglm8QN8vGQet93oEIQvXMYXIyTNTA0pSLQ6fivRKc
	Xao0JkjuFoLQ0t1xkphFZkUk1C4Xn6wfB8CYo/p4NcwbXAOyZH3RqwtO6v+fAMx8CawfLMbxWfH
	3wHQdcJUbIrFYt+C4vR0u0PB2oaSIwgnn7SY1Y2T6QVva/ENrsfUYQu8EnHp5vAl+EpSz6lY0CB
	iOSdlmWOT6UwiKVOdbFvf3vhhIXp7lLl1Y1yunDbqfdy5eBJD1uaEmBdlfkdDA/SqpMtPmHI1CE
	yqDbtrKUwAJiov+sYN6vgjpI8=
X-Received: by 2002:a05:600c:8705:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4852674e8camr33569795e9.9.1772804058447;
        Fri, 06 Mar 2026 05:34:18 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm80856735e9.4.2026.03.06.05.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:34:18 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: gpio: trivial-gpio: remove max77620 compatible
Date: Fri,  6 Mar 2026 15:33:48 +0200
Message-ID: <20260306133351.31589-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306133351.31589-1-clamor95@gmail.com>
References: <20260306133351.31589-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0421222203E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6142-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Binding for MAX77620 GPIO function is covered by the MAX77620 schema. GPIO
controller function in MAX77620 has no dedicated node and is folded into
the parent node itself.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index 3f4bbd57fc52..fe9b14a72d69 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -27,7 +27,6 @@ properties:
           - gateworks,pld-gpio
           - ibm,ppc4xx-gpio
           - loongson,ls1x-gpio
-          - maxim,max77620
           - nintendo,hollywood-gpio
           - nxp,pca9570
           - nxp,pca9571
@@ -86,7 +85,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - maxim,max77620
               - rockchip,rk3328-grf-gpio
               - ti,lp3943-gpio
               - ti,palmas-gpio
-- 
2.51.0


