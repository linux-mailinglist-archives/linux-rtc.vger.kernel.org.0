Return-Path: <linux-rtc+bounces-4283-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D34AD5DEC
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 20:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 440CB7A7CAD
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 18:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ED92686B9;
	Wed, 11 Jun 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="luzfbPO7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF1C26A0AB;
	Wed, 11 Jun 2025 18:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749665662; cv=none; b=HAjWXCqk9rwDKc9EdWCL+/4/hdNwrx236Mbp7qwl+aSWfH6/eLuQOXa4zzLEtEAu0ZlOfdEFCDHTLH3UJRfXZMQ8oSUYmkA2xVyYNjYIn+nRvFfJnb16d04oze/jKKhHNIakwHmZfQOpV/l9TUgmrs3YnDMUG3T7HuXMgnplRs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749665662; c=relaxed/simple;
	bh=39w8P3oLG9ffQgwWHPAp3VRDQ3K39fpZMLKKuhazPaw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=qg/Zg/qvYuEb6+CMKOVZj6F3t989Mvf7m92AEcVY6Bq3iWPePgLAsgGPflpEuNJ49UrwXTQBrsuSlVpIUZYd98d90uoUoCqszmWnRsy8ZIuI53lpgvLacERw/1RX5DD19TaclqdvDhU3d8pTG9EO3HeYMw8mpNR/kWfJ9HdxacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=luzfbPO7; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 16A392115196; Wed, 11 Jun 2025 11:14:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 16A392115196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749665661;
	bh=vifNDMqsOEqtxM1Hx9SKPQiYFcWKln6vrUqhXwYHPbM=;
	h=From:To:Cc:Subject:Date:From;
	b=luzfbPO7gQxJnX6qW+RNraySb84sjEZ5PqpVDt3qZ+59nfiVORGrPyEXM5Pqu9Esz
	 fzwHpnRysN8las/Mqna7MOplcla0Qypwj+vBMn1YQIgPrWUdkbD6urydh3yyU/G2QS
	 r1DgZO1CmN+ofla3y/41Ku41k0tugQWCMKLKOQPE=
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	code@tyhicks.com,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: [PATCH 0/2] Expand oscillator stop flag (OSF) validity check to ds1341
Date: Wed, 11 Jun 2025 11:14:14 -0700
Message-Id: <1749665656-30108-1-git-send-email-meaganlloyd@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

We would like to use CONFIG_RTC_HCTOSYS to sync a supercapacitor-backed
DS1342 RTC to the kernel time early in boot. An obstacle is that the
sync in rtc_hctosys() is unconditional as long as rtc_read_time()
succeeds and in some power loss situations, our RTC comes up with either
an unpredictable future time or the default 01/01/00 from the datasheet.
Syncing a future time, followed by an NTP sync would not be desired as
it would result in a backwards time jump. The sync feature is useful in
boot scenarios where power is maintained so syncing only when the RTC
data is valid would allow us to make use of the feature.

The DS1342 has the oscillator stop flag (OSF) which is a status flag
indicating that the oscillator stopped for a period of time. It can be
set due to power loss. Some chip types in the ds1307 driver already use
the OSF to determine whether .read_time should provide valid data or
return -EINVAL. This patch series expands that handling to the ds1341
chip type (DS1341 and DS1342 share a datasheet).

These changes enable us to make use of CONFIG_RTC_HCTOSYS as they
prevent the invalid time from getting synced to the kernel time. It will
also prevent userspace programs from getting the invalid time as the fix
cuts it off at the source - the .read_time function.

Meagan Lloyd (2):
  rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
  rtc: ds1307: handle oscillator stop flag (OSF) for ds1341

 drivers/rtc/rtc-ds1307.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0


