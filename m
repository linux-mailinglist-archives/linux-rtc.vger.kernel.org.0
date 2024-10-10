Return-Path: <linux-rtc+bounces-2139-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C69980FF
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A0641C2A375
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 08:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D44D1C9DC1;
	Thu, 10 Oct 2024 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="gTh1qXb0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54071C5796
	for <linux-rtc@vger.kernel.org>; Thu, 10 Oct 2024 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550196; cv=none; b=JagV6pgDPjTIgrAYIPaGIsrzu/aFtNzrC3PuplEYgH9u8ZBaNL3aznH29+2MQn08LpcmdgnoIPPslCvAEy3k5Clp8rxaa0VfK0mV5WMhN5aQW0sERSuXPehK4b3C8GHQNITTpgD+/wXL9aR1PwK9/5lN1XJztjcE8PSoew4Vyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550196; c=relaxed/simple;
	bh=5THYtA6Ul1zB/gIz0q/iDk6Wh7FvjiYUgAPVCWiYgOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=boKFW+zRnT4a6c0FOLl0ZYq0aJCQXG4sCEUxGIfinHEczuDk9RCsp2+LBBu1Roa2chxcxx5iWCYYWa/96rW95iiqrH8qHHL+B6mmD54j24auO9AR/IPqK8wRSyNLMhVcx5ObL/vkA0zqt5j4+IdDobnyEWqQuCgj8+C+Y8WMFh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=gTh1qXb0; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71df2de4ed4so464424b3a.0
        for <linux-rtc@vger.kernel.org>; Thu, 10 Oct 2024 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1728550193; x=1729154993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Is1+B0xT0DJgIJTfKwEPI2IKwOXoDmht2LJaO3sJfho=;
        b=gTh1qXb0PwyT/G404wZBgReJJKrnxPGNm2SPGpjV8JSrmAxZaaJWFAkAfi453zXmEG
         AXXsBPEpMgHLo0wWSOoV2b+3FA4ize1YziWwXnSsL4w9QN5uZkcdrjALqAkblOfxxB3G
         V21KGOJlh3XuCvWZ/1OKjy3s9qvYDNgNKXeUl21fODiDoWLruYqz1j/JGit3ZCD8Ro3k
         Xo+OkKTpZqbpv7F7tm3bECxJFEyex3LiY27kXRunVmJgmWR3cs3tIdonXxoT9z9RCivP
         imGQwr/3zZN4/TI6Ob2HhzlXQMlowFgu+ilB72iUhQM84Q3Og9IvAvVK4DB8bWFEgyVf
         AK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550193; x=1729154993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Is1+B0xT0DJgIJTfKwEPI2IKwOXoDmht2LJaO3sJfho=;
        b=AUGdinhen7cP/qVJWDtIbBB7abfzH/KxVJXeNRkF0YrC00jA/O45AYEHuzMyxQMvBP
         sb+7byRVWL7Sm1yiCOzYAhxOZleskpZ3v2cJ6ujiH7wkWfWCddpo8hpIxJJSyM5wAb7L
         cz98vg+9hsehVhOuRRmOsFRWKV1XI0I87OJd/UEM2GVV0aJA0zXn//IOHv24X6Wk6ufz
         X+4cvRJaFEOa/OSOVqEAndROCF++H7b2r9AyOzYjG+u7ZEobv9ZcjIRVjQsRnsp0EWo8
         XXchNh77nJ9sR0A4eOqSRfVexjP0P3HD8uyOcELcNhnCgmc6AsIQ25xuBMPBgFQcRrgd
         lCvw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ASJfy4EKSAhZTZUj2YO8aqiXbSp3bHhcksIGYqCWRLeqThlPKTGdwBF4DMxTb0FqUYZ1moetTmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyMuziSFg9xizHr4ze4oxpdT02hEF8GeVFMIbhzvzngEKjiIRs
	uW2UyjasamgLlUmL7GCexcuSgnD0O3/Ty2WIB/tj7zQoBodK6QqQ/dcg0dIJ
X-Google-Smtp-Source: AGHT+IGPa2KzS1lQk4kWYWB2G7DITF2/zRVYF1XILyy1zdpz94E76tG3SElO3xiV5vLLITgefyRFiA==
X-Received: by 2002:a05:6a00:1a8e:b0:71d:fd03:f041 with SMTP id d2e1a72fcca58-71e26e5b7c0mr3828812b3a.2.1728550192957;
        Thu, 10 Oct 2024 01:49:52 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:beed:8ae1:b5d8:8b56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f53f8sm614141b3a.55.2024.10.10.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:49:52 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 0/2] rtc: pcf8563: Switch to regmap APIs
Date: Thu, 10 Oct 2024 17:49:47 +0900
Message-ID: <20241010084949.3351182-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series switches the RTC pcf8563 driver from 
i2c_transfer methods to regmap APIs.

This series was tested with PCF8563 chip.

Nobuhiro Iwamatsu (2):
  rtc: pcf8563: Sort headers alphabetically
  rtc: pcf8563: Switch to regmap

 drivers/rtc/Kconfig       |   1 +
 drivers/rtc/rtc-pcf8563.c | 212 +++++++++++++++-----------------------
 2 files changed, 86 insertions(+), 127 deletions(-)

-- 
2.45.2


