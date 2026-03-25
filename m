Return-Path: <linux-rtc+bounces-6247-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL9ZOYKsw2nAtAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6247-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 10:36:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 689F03224D3
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 10:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 280E53121BB7
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 09:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE65532D441;
	Wed, 25 Mar 2026 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtj6c42a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1C4C8EB
	for <linux-rtc@vger.kernel.org>; Wed, 25 Mar 2026 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431022; cv=none; b=ZpIMxQCDAGZIsr9fRZXUdJS1Tl9FuQF9IHK6jeJM0zWiBwIGYAGdtM3W8JTLGYvacs0wCKY+tyOeBg0wvas+zQTxgP/UcIZN9TWii6EFjc29t3meNLZaXx6C17GkveJ9bY9Xa/gcabiRYEVCA6hUZD+6hS6JM/XFa9YFUqM4W6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431022; c=relaxed/simple;
	bh=f9D+YL1OUkQdY12lkA7AFCjjqgAZ/iTBTH+EZXJs1T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCkqFCuJE/RzkBe94xv/sMKIibTGgRW4qm9YltlQwHSCA4DhwE9hNgQvuTwr3aog85Fyzd0zAbCRikJZbI5o7hY5St7qzzdjuFmKpqDUzLJz3j30+AXPYgWQszJehL7W+6T3GNqnGCj5SMBHSuHfZDWs4HAy+wrVPfIK3Nz53wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtj6c42a; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8296d553142so1219770b3a.3
        for <linux-rtc@vger.kernel.org>; Wed, 25 Mar 2026 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431021; x=1775035821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+myNUoESzTzunmiunAZb/MpzeT9fXKqzdgO8jfvhhhA=;
        b=qtj6c42as6Vo0jP0wRb7FFb/6s/VaTyfPVj3pawuyOvhiK+YtWs+3x9ksZlpt0petQ
         ziS6S+Z0r1AguTB+xlsPwlqY9wV3csI72A5SF4wiW82Yr6bV9Cn7YN/6FCyQuJ7Md3gk
         d4tHD0IwpiUDeATwpla3pifcxJJdLR7sqZgs4YyCg6NSCNLHBT7xn4t5EXg4ZeTnzKeT
         GthDJ9G9TDTo78ufNNAGbLY0Uz8qRWieqBSMONw4VjJMhCz8pcyuUsRkigRmb+I9RnDF
         LynnseByTfuqDTH6c0ihPA4Tzjy5c32YJQ+vraYpfhky1GMTMwOPVK9LigRUwHOL2v+7
         7eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431021; x=1775035821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+myNUoESzTzunmiunAZb/MpzeT9fXKqzdgO8jfvhhhA=;
        b=VqispNy+PEzZvDJefapiEk8CgApfDku08hJjWlec4gxOnxboQBgalrRpj8skJFIh3w
         E6l1yzjST0klkwczyfDvQUVK0thTaBztlpO2Mgw2hfdFXdTcQ6UM6YfvzUXIueoVbdan
         fz1VmG8KCg6ltQMRkai9+leghc3jPthe52ZCZFbGNCbc5va5a9rcZJ+5FBue18HKo95j
         w8MaoqsrEL3pBjboJJhV+aIUmMXGcSpczGbOVah6H/DQXWra+prb8ila9oWgKue+Bl9L
         34btcbn7JW5wRHOl57e6O4f1aBK+1xPbGjA1SKWZWv7eH8nDGwvRiKid9VGIzSHl0A78
         /pUw==
X-Forwarded-Encrypted: i=1; AJvYcCWYL9I8oHsNki5B8EbWvZ+Xv/XmUmaxhd1FO/9U1O50EVdGonELDNrQZxnbBCRZvWTXSGW+iC6Tmw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+DgK+HDShbxy8d0MeoS2E3XGhMt1dq9AsiqzMKuQpOKK2Ytj
	YbvzDdR5QFEyluiEuqEAy5uiMMx+zZpT6v8HPbbgMvQBLvxW9PuJY/Ky
X-Gm-Gg: ATEYQzwCDf7d4KLJte00z1BafVY4pobwOH/e4uddL0tUGxoGQufPohxIxtqCkLI86+E
	fGposzicVzvsg+bRytwDyCvhNAySI+1zXVvOslEsea8lWGT1INkRIumwn1YMoFImMVQBVukqx3T
	l5PbvmTCJii+hjvIQ0RiCvqglPe3Grw1LeOCnkrUGyRfq4quH/MCvQSVkVZFVTWun0r80FeJoo1
	nBFdb8N4PuequEzdulhAHGvsoZLP3H0m1NAZVV4zF4uH9kU8FLIyQMoUf0YVXLDVoTO3St77LFt
	1xsPZoaj6+s0XUIVmNgiQNDKqlZ/jfLp6/GpUFDbcWTQ164NN4pyM83kHUJuGMBfwKCDWmP/yIQ
	89m+sx6fb3n+Xh81YdUOIeZdbz8eKQlfATscGHBung1xc7zPgSLPMzsyqILnBaiCopzJdNvJnCt
	Ay/PyDj8kAWOwoNx80ExyFeCg=
X-Received: by 2002:a05:6a00:1ac8:b0:82c:6b05:d756 with SMTP id d2e1a72fcca58-82c6de9f69dmr2775901b3a.20.1774431016212;
        Wed, 25 Mar 2026 02:30:16 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm14781398b3a.31.2026.03.25.02.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:30:15 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: anushkabadhe@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsd@laptop.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2] dt-bindings: rtc: add olpc,xo1-rtc to trivial-rtc
Date: Wed, 25 Mar 2026 15:00:03 +0530
Message-ID: <20260325093003.44051-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202603250854523a8809af@mail.local>
References: <202603250854523a8809af@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6247-lists,linux-rtc=lfdr.de];
	TO_DN_NONE(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,laptop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 689F03224D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the OLPC XO-1 RTC compatible string to the trivial-rtc schema
instead of creating a standalone binding file, as it only requires
a compatible property with no additional configuration.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---

Changes in v2:
- Move binding to trivial-rtc.yaml instead of separate file

Note:
* This patch is part of the GSoC2026 application process for device tree 
bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt | 5 -----
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 2 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
deleted file mode 100644
index a2891ceb6344..000000000000
--- a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-OLPC XO-1 RTC
-~~~~~~~~~~~~~
-
-Required properties:
- - compatible : "olpc,xo1-rtc"
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index b47822370d6f..722176c831aa 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -65,6 +65,8 @@ properties:
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
+      # OLPC XO-1 RTC
+      - olpc,xo1-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - ricoh,r2025sd
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-- 
2.43.0


