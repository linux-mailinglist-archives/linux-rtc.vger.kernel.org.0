Return-Path: <linux-rtc+bounces-3272-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B0A45F4D
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2025 13:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A513B7FAB
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2025 12:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E6A22173D;
	Wed, 26 Feb 2025 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="opNmXMgS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F0222154A;
	Wed, 26 Feb 2025 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572824; cv=none; b=O0tyVI1hFIwYBtG3Wo1R5vduzyKimHrkFmIDwy+aO074Myz0UXrkMAZ0ROhus4gLJJWM1ZCcvfjszReTh1Gux0F0+JeS6ND3Nq1PtB1mohzJql0towTv3xkH5lCbAzXgvP0MpR5+fmsBT3ka/1JOOKU1RUvHHJ2W7q99xk51/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572824; c=relaxed/simple;
	bh=oYzrTYc2RGFVwYnLrf7Ll5ZymYellTDGnFS6pPtA3aQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHhj37igYdvGXtyg+VLZPIoqqGcePPl+moYoI9m8nQ5bKEAptDN89ueLQYtqBMa85v1vyin5xU3Xsjz7vOtMFqrwu0a1sOT6uGjRl0dTO1Swf4eJVv646SUW6xkwjkVwJF/zABzoIWlsud7H8DmylAdL+TeR2kYPbn2OCcZLW/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=opNmXMgS; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MviWYJ/Xj/+79aUsSGjFXPKTVq9VdZ93PXixDILGdK8=; b=opNmXMgS/uMrwLgx3wqHo1hhpT
	i5h9FZf6OSbAVExBjlhs3sUVIqJTcW3UNx5HJEQqU2itcRTN3oAX/Y2mVc8AnS8HLjIKQV8LU7dBJ
	HJ28tTLDIC/EVMqpW3i9VRGOZQz3cv+9WpzrPWSxQ3w6WI4/7fRi9x+/IcsieVmo9ei/oUao6uUMp
	WAc5S/jMCU8azgwqc6R8UdXoH2IcqCpX+rUKzsEhB7G0lvxE2RC4vei/RdvdOqGpKeLPybbYHFvUJ
	q+1/cRX/ufpGcXMfSfV6O7PivJO6ZyjWEA9cYj7Xm153msPSspBtLxYn6rC74apTX2RSZLEQapYPW
	9R6csVEA==;
Received: from [179.125.94.240] (helo=[192.168.67.187])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tnGV2-000xB7-F1; Wed, 26 Feb 2025 13:26:58 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH 0/2] m68k: bvme6000: rtc: convert to rtc class
Date: Wed, 26 Feb 2025 09:26:26 -0300
Message-Id: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHIIv2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNT3Vwzi2zdopJk3WQTM2PTRItUA0MzAyWg8oKi1LTMCrBR0bG1tQA
 T8nYBWgAAAA==
X-Change-ID: 20250225-m68k-rtc-c4635a8e0160
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
X-Mailer: b4 0.14.2

This converts the DP8570A RTC driver to the RTC class, instead of directly
implementing the /dev/rtc RTC_RD_TIME and RTC_SET_TIME.

This will get rid of the last RTC_MINOR user in the kernel tree.

This has only been built-tested.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
Thadeu Lima de Souza Cascardo (2):
      m68k: rtc: dp8570a: split read_time and set_time
      m68k: rtc: dp8570a: make it a proper RTC class driver

 arch/m68k/bvme6000/rtc.c | 207 +++++++++++++++++++----------------------------
 1 file changed, 82 insertions(+), 125 deletions(-)
---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20250225-m68k-rtc-c4635a8e0160

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>


