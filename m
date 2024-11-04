Return-Path: <linux-rtc+bounces-2448-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBD9BB820
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 15:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740761C24C83
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 14:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D99F1B5EBC;
	Mon,  4 Nov 2024 14:41:27 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBFD2AE93;
	Mon,  4 Nov 2024 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731287; cv=none; b=bCt1euLQcy6FItJTEDsZWWXDgUBC4Qge5VkJRS5jeCmCYktJOr/DpB/ADhR6kfBNRhnD4pbvsmKS+UR1YYpbqBZ6fbXtzhTa38wqaJ+56wpmpkPKr02XYcVSBnZysI6oKS9T+w8Wp9vLwdQ5AfM/vyWyhUS1fhOVMxkN8cNg4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731287; c=relaxed/simple;
	bh=IeHY557XIBW2uvlyi1J/3/7e+moNgw/Ilc7cUzJxNRE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FOMna8vO4NoSLFO5cxPUuZDR0z7fXJZ3XrR1I9F7TvsoW80+QrDGBKuFgSpZCPwbLMf9rDTqtMxM1hWdgLjtY4TPG9WOvpYdujc+A2hP9LcAu5vSazXFqYNgn/OA9TB/Ec/kGsbByZGx61rp9GB2PwdCuhrbJ1c/dJwD4gnM3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4A4Ef5F9068300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 4 Nov 2024 22:41:05 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 22:41:05 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <tim609@andestech.com>
Subject: [PATCH V3 0/1] dt-bindings: rtc: atcrtc100: add Andes atcrtc100
Date: Mon, 4 Nov 2024 22:40:52 +0800
Message-ID: <20241104144053.1136083-1-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 4A4Ef5F9068300

Document the Andes atcrtc100 device tree bindings.

CL Wang (1):
  dt-bindings: rtc: add atcrtc100 Real Time Clock

 .../bindings/rtc/andestech,atcrtc100.yaml     | 44 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml

-- 
2.34.1


