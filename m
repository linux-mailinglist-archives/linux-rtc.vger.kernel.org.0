Return-Path: <linux-rtc+bounces-3535-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED5A65D7F
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 20:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDBED189A837
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 19:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388FA1A0BCD;
	Mon, 17 Mar 2025 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FctDCp8N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE04A06;
	Mon, 17 Mar 2025 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742238133; cv=none; b=q9VRVzfnflt/RXMeaJxxlJDMjrxnKO8IhPXmm0CjXR3qIOABhj50dHBZyrXGBWDCD3S7vhmE733ubjiR3LwYxcnMn+fVLlMTavvM2grS81JdP3SxYw4b5ZeL77Ku6tp4z9qeiuFjYa84pXBBSB/QyBPs1+2N+UhWlkm4e360A7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742238133; c=relaxed/simple;
	bh=Hvttu3ONsKCVI+zX+/ec6G/+a20ZSKSWdAO/LAA+zDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jI6qOW/5BEC31YPqyd0j4arh23lU5RHkwSwEx1K+8RlJDA/wRruCQjIV6IsEJyX6iofy2/umnK4wD+R+cAzJLhL3E7D6QhVYETlb1taW7xEhHfG9OiA3LWUom1eQDQy1+HO2yFkVyAd1xIYiPp+kNx+l6ziJ/3plzwdQe4vC/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FctDCp8N; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so5569221a91.2;
        Mon, 17 Mar 2025 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742238131; x=1742842931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVCXkbbka6K+VZe0MGxgjrGWBkeWob34kqWL102MXy4=;
        b=FctDCp8NhceW3lJ/wwc4Pu7fviTdnlw0xvoasaOXhoW6z9A0rFrkP6aF4igALkqFRz
         XKSg1Z2Bp+LbK6Ndf+3Q8nwBo6XTxCqSHwyoQNASaJN9UYfoIDCSSVX2agrzG5R/cczJ
         eGvgC7IHAZVaa9TMv2FykHCQ6QGUkCjTUQtySpgzmgwUVZjiCpV72Lzl5svCr0u/LF4p
         +8W9NIlcFq+PWGYvpE3Je+ZJwwb/c/qXv0j5pe2NgBRWj7LQRN7+ZN30Mj+rYwE6BAVc
         9+dNTCMr5+TIJ8CYieiFfd22XRhVaOtgkG+kVTrcSXzINPnXQtQDcM5DhxhzcHg/OZy4
         yOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742238131; x=1742842931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVCXkbbka6K+VZe0MGxgjrGWBkeWob34kqWL102MXy4=;
        b=hPxWH2X4s4dMw2j0SVJSrZu6+bOCPlpp5vUmJfUl5N4thVLnENwzukND6BZCXWtHu8
         C/esfW3zUjLU9ekTSynOX61djmq0tZ8Rg5D3cXyYeze5D+bN1x4u5vK5td+6beKmtMRA
         J3d9dI9MkHLdkgFaDVP1LfXKxXpEu7wpZFxDukKVywEOCpwD2Ya336N6aRxURS12lL61
         8OPIL/sSQ++GxU1OrGaIrh2ORb43iFLGiR0cVcaZ7X56IAAGZCH7okC2f7IXmqRctGHb
         HqhlVUO0BmbKarKcvL3lgAXBHpZz8kJ5qzrOlfEuVHVSm+VwlXocJtClx4hOD/u8lhjf
         jFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/wv5dF4mNYBqn5vU7/maYxncV3vOn2HIe2THorVLq51O4YYj79HWSbTE8M+zRAKs91Qcxyq198viw@vger.kernel.org, AJvYcCWrStmASUqZ6e0G67lLg2QmJnjn5y6Ds1NyEjlY7c858owgFv6XheR64uD+mewtQH/65e+aaHPo9/8k5o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEHO3oEYNis5X2bF8BkR5wchBI1ft7GAgmT1WQXCrFrwi0cZx
	3w/uTD4C0s7oYvInn/Vy8kOIjOLNL6Pykb6qHiN5uy0Oq4hJtrav
X-Gm-Gg: ASbGncsxh2iBTn88zC7jH3bxSa0CdgWv70URfUjxzfYXoyrOy7Vh3p5+lMw4rafowAk
	bzSJ7k2I6LjqPM07PkDCzb3I9t1SiJe8KtAb5r4UPLvh2UglHF0V78T8DY6EgnEy0/0EkoWroKi
	tTdXldJYX+8ndawIFBrh3NB2Ia5dw/q/7vpf+qJxG7jG1eXLCZyV/ips4efXKDEalSs7Psj+jE5
	NuxJWJ9K0oYjsIb86Dhwz/YW/mKt7I508ml+QuNZpy/2jUL3RTJYIcTg0raJxQ6wTQPHn5Tvqf0
	glIDGp0lKiuAARtJ7qu8+sJS5ZxGlggBOCeV9j8gIW2B8QgtLNlTGt+cA221TVJYyQ==
X-Google-Smtp-Source: AGHT+IGwW94/c+nWHi2B2aO2rPj0vPspA7nN6VmmEbHkP3+uGtj1SqduHMk+oLRnKzvqVpsyVbzStg==
X-Received: by 2002:a17:90b:1f90:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-30151c5df91mr14364174a91.6.1742238130859;
        Mon, 17 Mar 2025 12:02:10 -0700 (PDT)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301535196e5sm6473747a91.16.2025.03.17.12.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 12:02:10 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-rtc@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rtc: fix use of uninit struct in rtc_read_alarm_internal
Date: Tue, 18 Mar 2025 00:03:43 +0530
Message-ID: <20250317183349.346399-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trace call invokes rtc_tm_to_time64 on a
potentially uninitialized alarm->time. Move the
trace call to the path where we do successfully
initialize and read that struct.

This fixes a KMSAN warning.

Fixes: 29a1f599c0cc ("rtc: Add tracepoints for RTC system")

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 drivers/rtc/interface.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d..82ba33bf478b 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -201,11 +201,12 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 		alarm->time.tm_yday = -1;
 		alarm->time.tm_isdst = -1;
 		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
+		if (!err)
+			trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
 	}
 
 	mutex_unlock(&rtc->ops_lock);
 
-	trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
 	return err;
 }
 
-- 
2.48.1


