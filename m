Return-Path: <linux-rtc+bounces-3940-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F9A8720C
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 15:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02823B211D
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Apr 2025 13:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0831AA1E8;
	Sun, 13 Apr 2025 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEuWOA//"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA9C1E519;
	Sun, 13 Apr 2025 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744549709; cv=none; b=XxX1Ue1Bq7bGFlzgZDf9U3xfreD8qtFoEUjhYOIMM6AXd368GOrzaEY642eflnBgbm3IfTgxS6xNubZOORk0o8coppGtesckWAqd1IUSAUMuwvuZmtihoaABhQm8tnLFf8gqAfwz/ezBCDsVi1F6MUS8Fxou/4Z+YAfcid9Dq/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744549709; c=relaxed/simple;
	bh=dd/290aZNY5O/JLWsp6iT01AgdGYQcXC8+O//KRhEpg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FkN130uKOqbMc6qA0rvI0KnQgRGdH7SpOJm/TCMhnR5j2jPY2R5gzX3Ajsa3Z5lAWuDWi63mvvtCILODtAc/0HzmnOvvbVZUTfkofB0ehPOh85G+RVkWDhjeUZheizZ5ADXFs13Xf5smez3caXM2qbuAATDiHIBTgPPQwm3lgDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEuWOA//; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so2162269f8f.3;
        Sun, 13 Apr 2025 06:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744549706; x=1745154506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spwwddOcr2bxy5oZCe+k46ppxSM8rzeZ93fwj//zW8g=;
        b=nEuWOA//0HHPR/R/ScH9YAwADh5MccqPRjWZsaqFR6K7/OmfYOHlAZdsTcvFrtdOKg
         vetQF9/ieHeR12qr3H/kHWFAwLY22alN9YFlxsEB+Ef0dfkYAObqd3/A6wjIJYjjDRf6
         XEGNWFuXeGM6aIcKgZnHelQ9l1L/FRBUzpSMn3oZoUpnP9UmNRUkz4KPfgT54EducUfY
         uNYGDrAK4T7FWygJCbkdv3+FURdbQQCfHlMb6GbkO52QdZT77na5CEj4OIQm/2+ThK4K
         h6c1cK6wUI4WqSgB3YJrTSt1rGJkAiuUBU0BU1MhCqCERHP70lOaNoyCaIyIFuRXsRnA
         tWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744549706; x=1745154506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spwwddOcr2bxy5oZCe+k46ppxSM8rzeZ93fwj//zW8g=;
        b=jAbNWjx39hiiLIWLlqEs1lboPf7ej7ACfa2b82mgXVS4FTPRO2cpwwCU3GY8Yi1dY9
         4ygkbLgig3/CM1fTB4iQ2BSS9fzmoF99Y2lmOK5cqLQZf0DIXWirE8QJAtbqd/7OfmFH
         oUcxosSOxt2iclxDLax+mo8vo5bInjugioXESKH+CHSoQcRMTUYZhHHiQ7fqz8AWtnsR
         eUmAtUjgZNPyPYk7e1ry9OkzoLCHvDEJKq40LP2RnAUcGZjYUEkyzoeKQwWcTcs9v7TH
         tgV2BVxURBv/+bo1qM252lZw2H5+U3k8BbEBkX54wPX1VgA1u/AyUjnKjRPIp9zCD3kX
         W9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVpUq57/NLAK0aeXzVHZGnyxNIKToSDR/w6IZ9TAjE/wFYclZkKEXdHclXZxCLLRk7Q95FEP281yGaxHAQu@vger.kernel.org, AJvYcCXPQk1WJSxF2rXiyOZGvppvm3YA4XcGHGVszbtfLJd9Xwk5k6QnlJtI5ej0nhCDif/dhn7pj4FYdPgT@vger.kernel.org
X-Gm-Message-State: AOJu0YxzyIuI+PjXSbBNaOXtesbbMxJrtPp8habU9yzMA6zCv+phUN6u
	KxYoInz1qku1b7lgD8z51TdIccy/hAW8NA2uHwml25xjiwUQk77k8Lwuf1vA
X-Gm-Gg: ASbGnctuI1/MxUeCYwWq6IoJM28kkX1dE8m/T47AXu6cZf22JMJWVaIwqL3DedZ50Ye
	EMu5Jh9QwET7eyKj40QK7+vXWjp/aruvw2tJs84QLxH4RXzMSEpRK13Auq3g20+QE17XTyPjNdn
	1PXItIBxXSMlYKZewq/2DhfEx+EIqTC1/AeZZL9bX946baaj45FxbZcZnQe1Gbz6CgTK8v4JvGZ
	WEee8B73Ova7PkifgkNHEzmXJX247orxaCNu11/P7ySPsaRfME9pHXIf7xrQVgaFiACDbOrgGQ5
	7WVGtEpyGVho5R8F9vOoxrmfeIwRf4IzusAp6gTcaIv/PaPVv5gURUmfFjQ=
X-Google-Smtp-Source: AGHT+IFI9TKLIfmu02S6gG9cSjfcuxz7gzLxeYfdxtdAlboYNo2/2d6+nltWLgOa1eaE2njphuuOjw==
X-Received: by 2002:a05:6000:18ac:b0:390:eacd:7009 with SMTP id ffacd0b85a97d-39eaaebdc03mr6390604f8f.42.1744549705467;
        Sun, 13 Apr 2025 06:08:25 -0700 (PDT)
Received: from localhost.localdomain ([37.161.110.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445737sm7739348f8f.88.2025.04.13.06.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:08:24 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	alexander.stein@ew.tq-group.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 0/3] add support for RV8063 SPI rtc
Date: Sun, 13 Apr 2025 15:07:52 +0200
Message-Id: <20250413130755.159373-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Microcrystal RV8063 real time
clock module with SPI interface. This device is very similar to RV8263
(which however uses I2C), so I decided to extend the existing driver instead 
of creating a new one.

RV8063 datasheet: https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8063-C7_App-Manual.pdf
---
Changes since v3:
* dt-binding: fix indentation in spi example
* pcf85063 driver: add of_match_table

Changes since v2:
* dt-binding: send as patch 1/3, not patch 3/3
* dt-binding: fix indentation in spi example
* dt-binding: fix order of enums: rv8063 before rv8263

Changes since v1:
* pcf85063 driver: drop MODULE_ALIAS, add id_table
* dt-binding: add "pcf85063" to the commit message


Antoni Pokusinski (3):
  dt-bindings: rtc: pcf85063: add binding for RV8063
  rtc: pcf85063: create pcf85063_i2c_probe
  rtc: pcf85063: add support for RV8063

 .../devicetree/bindings/rtc/nxp,pcf85063.yaml |  33 +++-
 drivers/rtc/Kconfig                           |  21 +-
 drivers/rtc/rtc-pcf85063.c                    | 182 +++++++++++++++---
 3 files changed, 199 insertions(+), 37 deletions(-)

-- 
2.25.1


