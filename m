Return-Path: <linux-rtc+bounces-6350-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFZSEn2y4Gm8kwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6350-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:57:17 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68740CA31
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6835E3012E4C
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438DF396573;
	Thu, 16 Apr 2026 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="SKtA8mMA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799138F942
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333433; cv=none; b=kLZUAviI9JNRmHM2RTUCg0Lo6eDHTNdfIqscEU08Bvqv+pBVsZkPyCsvJZNsq1kycXm622Q+p7o7OR0xNXTubJgkw5t/aJ1j3yq9l7mL/8HsAYolNauisKsXgoK/SQ+SPRzm0R8H5D3PDdIMN2RbmvdWo5Z0jD5CguP6PgWMV7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333433; c=relaxed/simple;
	bh=Z93aoZXsS4pPjtrQ7mV0ll0Vqxggd4ubOPS1K6vIpws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W89FYXR1GZ+DSugD917ar1JguL5DvzCi2Jhnq2HH3z7QA3jQO/EvsLWk+1tF2Ioem3+UbacDlNViOfJCamUOT0THbfETnJXTKM6b/5OhFbR/xzNi33MW6tWnh5PvDkHEVvUrZf2Vtyi5LyrxlnxyIe2RBPpLzViE1EMbqyNp4gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=SKtA8mMA; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2dd52990758so268696eec.1
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776333431; x=1776938231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baWnCd3Ai+g3s8cPvIXwZp8BjMnFuTX7HKvOpj4gYZo=;
        b=SKtA8mMAWddFDdTJAsKoE/bDYdP6YzIXa2Si80/c8hlKn3XEJIKYjyOve5ORogQ3aF
         y10h5EH9RrRNpBBkXOVY0KEl4soZCU2PMnHAjHqR180t3E3Zx22+mwQbiAtu4/M4vOyL
         AG4MmH/PkkOcb9HbpdYNIZQLvTeBG7adz04O3NrC1OoM/G9uQ6z4NOxvSs11NhHSs5qw
         rklxZUtrZE4K2enRKL9VDzfpXD/Rn1ThsnB4r9bkvXlcfDMVV2xrg6Cr4k51XLtPrwuj
         VZ9XoEu4giBR3iKVirEIGR5OICJ52u0imWQsBmgA/6uHk8FeX2sU/bK0w/0cfL9VT5/N
         PUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333431; x=1776938231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baWnCd3Ai+g3s8cPvIXwZp8BjMnFuTX7HKvOpj4gYZo=;
        b=cAEnYFQMbDG7OuCAvHb9u50BXs74E+T56Z8zqqZGBTZr9e80ddrcsetcZtDBghR7HU
         Ie1+RwS/JYONDQFywCcmNP0DYju8KSdkihKPPz1cpMH8JfwPeS610THY0bB7PGX8Hgoe
         fq3+w7e3pzkGg3eSdbO5WW1wBPIVHuoJu2OFXnLKh0ap7+7SDESg4RS+hYU0NerKNMsG
         c0bx35T6utdBLf/UA+Xqe3TShUYmyGfF224qZIDyq9dofjpNn89YjlowEt6sEp5Ock3M
         nhay2jiUslxJ0NLTcVw0G16P27AxdEEKPSxO82cYGjl5TQ9LEF3nwkmVhnRt9El3J61V
         oRpw==
X-Gm-Message-State: AOJu0YzvW8X5MqBeViXnzmQiMttwh+shnccUPa626pHpoEOCNLD9fS/y
	JdX/+ua+oYZhV+DErXQ1SZxi/Aj1jZ4C0AwaDx7EmmAFBNdCyXCIbxb0Ky1NnxHQgw==
X-Gm-Gg: AeBDiesuuX9UXPm5y9fXQV8zq9no6wA6dewwF3FvcqzUPU6N4wClwC0zfUZAko68PfI
	D4rA4RfWKthU/pv9LzDyQm3H0wOwYyPSQi6rEBWAxl9z3U9zxSvJEocpEiYDnr6aGpPbq4oBUft
	s1wohPOFHCdE9UX0XMnFx6hnE57qBXdKoUsZbcry6zsGxbiy+N8zWjCUKAZ1cdXrXIbfnzwYbVV
	81eeZ2nxZFX9y/YkxF77fvt87yAhKpWlxn0PebDeoIjsIPtSa4UYlyDRfpEsSHIdLrYNDgvY8j4
	nNZ47V+ojLicbc9L00M8noulRBlvcgtRdx+HsLQAM0lo9CEWyArUTrNn9dBSA2D18vOQuZZQN0y
	Obbbit4+MICoOKEI9fu31eASe5iJhc6fwyVsuBHtuVuCqcFaXwP9Lha6OlDPl3DMm+PyKCe7pq2
	Md9niaPFqfVNjE5NGMu5uNYDU2/yhheffYUabLIxIrerFGKjg7iZVgfSErfJU=
X-Received: by 2002:a05:7022:519:b0:119:e56b:c3f5 with SMTP id a92af1059eb24-12c65d3aacbmr320152c88.5.1776333430634;
        Thu, 16 Apr 2026 02:57:10 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm4532913c88.15.2026.04.16.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:57:10 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v2 0/2] rtc: bq32000: Add settle delay for aggressive polling
Date: Thu, 16 Apr 2026 02:57:04 -0700
Message-ID: <20260416095706.3212158-1-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416092414.3210383-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
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
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6350-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[arista.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arista.com:dkim,arista.com:mid]
X-Rspamd-Queue-Id: 5A68740CA31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses a limitation in the TI BQ32000 RTC where aggressive
I2C polling (done by userspace tools like hwclock on systems where the
interrupt line is not connected to the CPU) can prevent the refresh of
RTC registers.

This results in stale data reads or select() timeouts in userspace. The
series introduces a configurable "settle delay" via device tree to ensure
that the hardware has sufficient idle time between read attempts.

Patch 1: Adds the "ti,read-settle-us" property to the YAML bindings.
Patch 2: Implements the delay in the driver using usleep_range.

Changes in v2:
- Expanded dt-binding property description to explain use case.
- Updated commit messages on dt change to describe the scenario when the
dt property would be necessary.
- Reword the commit messages to respect wrapping at 75 columns.

Adriana Stancu (2):
  dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
  rtc: bq32000: add configurable delay between RTC reads

 .../devicetree/bindings/rtc/ti,bq32000.yaml   |  9 +++++
 drivers/rtc/rtc-bq32k.c                       | 34 +++++++++++++++----
 2 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.51.0


