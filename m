Return-Path: <linux-rtc+bounces-3819-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64BA7EDA5
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 21:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5241882D45
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 19:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A5A20A5CA;
	Mon,  7 Apr 2025 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6kbxtP+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167ED1EE032;
	Mon,  7 Apr 2025 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054576; cv=none; b=o8ukBejdG2IN7LEwO3ll+/5QrdbfvA/70qcYrSl5K5HR4se56ZS3UR6I8xDXx1pIzVZxfouLJ32vBqobG9FCPkQx4TqTN1Yo1J23VuRtITvu8buAnIwd86t4Nk/jGlJPLFdwZzXr/RdUMq5U4mplBe4vEnBT21Vdf8BhqqeQJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054576; c=relaxed/simple;
	bh=PGf+PWygfURYG7GELKR04VgN7oq/1lb4aDx/b8mtoUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AcZGVdMuwyagjLSWhFUWJuptlXw5fLVwpZJ/Ntk7QdGhDwuCyZrkybqIwa+ztJ9OCTaKdRZBMIv3y0Fv0OHjy/dczoRBOcfiPhDNAZLFiCLMwy0HJ2snWoKsmCN3yq89N74KtIbpJHIcIPwCGwlX07yDC3kcAxX0ZRelVzVPMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6kbxtP+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso2909792f8f.2;
        Mon, 07 Apr 2025 12:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744054573; x=1744659373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DDC/XmzkR1FazY57usHSDMiJGUj4mKYyQHoSta36HE=;
        b=A6kbxtP+kVxrZw4q/plb70zqyC0Vj+gakrstGq60PUTWSkuB/Ea8UxtUmF9rfaeplP
         H0xlf9R38v9FH8bgG1heak6BDN5bFXqz53gasB7X5ompFucCiBnkY4IUqw8Z/CBNakbH
         A4U/it+2fXBSm+A0XUOuQZdHCjD9y3zZHEaOoEy9EKJ/IG+0dSmLK1nZC+/l0I5HPpAW
         dszy3T95BS/a3DCrKUKAdUNdPdSWodaSTgf5/9dOSJsWsJYt8lLHqLDzc/RQTZlbbLNZ
         yiwBccD9/n5YHfVk9o9SMQdjRNa070KYLK00k2XIkML32wkEUAm9I5xsNHojo/6vZ7Cz
         FFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054573; x=1744659373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DDC/XmzkR1FazY57usHSDMiJGUj4mKYyQHoSta36HE=;
        b=KOhrxIaUj29/374tHl6WyT8/vqRPBkr6CsHQxV/o6cR9gzFEyGnTJZfTf2ypIaw0U2
         +To7O0HDDwsB8eOQh1MvXX3gV6DTfa0FsOG8lTjLnKUfvdTbb4WwZEa62D3+HvvcV931
         h05CpEaGm52y+3rKsAQwfKEvaJFAF6I9n5oDVY6tE3gO6dZ9d4R2xNhnwySNSLGOQ03j
         0bFY48lcl5o4xNKkKVIEpltlB/xBCvJTGFLFefjV2PrNc9pe1ZnLFbS1wXJYRzuymqMh
         WZXbhRpw/G5I9UuSxS0U4kHY6MCsnLZXluwsx/9qrywZmkrOoItuAtZsDwCzM+druAuu
         KjyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs8MR9UEjH69wEexbx8tuNnHUbMfag72Mf65PvhsQH0s8MtpqSFslwj+USxoRZ9rJNAzx+DomlgqVLQ2Ho@vger.kernel.org, AJvYcCWGLsOBVfFHapBOLSuIYYvgNNXo5ppS6codu9JGKunz1lnVSErOnB1cxGOB1n1ceaUd2Ua8ZM+RvCnd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3asQTFuUa6Yub6QbkncCx+qTnnVObgZAWqkJF8r2sXgxlbRd
	FUDiPGI2T04PfsM2IbE+kf5Ypx83dho7g7WZPeSpZO5sDFUZWlbCmakvGzQj7CQ=
X-Gm-Gg: ASbGncuZ+hretPRw8LTr0qyk1gKAfKK85m4VBnsmZGiR41FBqn8io+0bbcxa0p10mVh
	vcR1ww9Jazyy+mbsljnkzxbsBiZ1NNIOf9WrheZ+9sXZckFBFS9DztmAraBCjH7mvl4RunXJ2dd
	ZsdEFVGXYPbLqkxvuBwk6pKpmwIwOiDw4AihGoJ/P1KqoQnEv4p42g88Yoi564SGBRGY2lz6CUf
	0XHEskPQncVqLgSwjw7sitg6T/wj67nemc06n3l7+n1htARB/fF6SpFDTeyNqF80an7hixtxLiX
	DybxdSUqkeCrzsuYim3EOgcI5AbDOCP9QnqgqroSM0rSmwqylGt1DOWXTHkfdzA=
X-Google-Smtp-Source: AGHT+IHByGiSgfmuVXdJ546MLKCDXJvNioFQ6536g04viX5iJMCPi++65BUkewJThbWYuB8YyzQsbg==
X-Received: by 2002:a05:6000:420b:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-39cba97f7e0mr10468870f8f.55.1744054573160;
        Mon, 07 Apr 2025 12:36:13 -0700 (PDT)
Received: from localhost.localdomain ([37.162.191.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d62fsm13122812f8f.79.2025.04.07.12.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:36:12 -0700 (PDT)
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
Subject: [PATCH 0/3] add support for RV8063 SPI rtc
Date: Mon,  7 Apr 2025 21:35:18 +0200
Message-Id: <20250407193521.634807-1-apokusinski01@gmail.com>
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

Antoni Pokusinski (3):
  rtc: pcf85063: create pcf85063_i2c_probe
  rtc: pcf85063: add support for RV8063
  dt-bindings: rtc: add binding for RV8063

 .../devicetree/bindings/rtc/nxp,pcf85063.yaml |  33 +++-
 drivers/rtc/Kconfig                           |  21 ++-
 drivers/rtc/rtc-pcf85063.c                    | 169 +++++++++++++++---
 3 files changed, 186 insertions(+), 37 deletions(-)

-- 
2.25.1


