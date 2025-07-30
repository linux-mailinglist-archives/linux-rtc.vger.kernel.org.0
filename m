Return-Path: <linux-rtc+bounces-4601-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E953B1580C
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 06:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A469917B118
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jul 2025 04:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A491DACA7;
	Wed, 30 Jul 2025 04:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SgUje2in"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99CA1624E1
	for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 04:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753848968; cv=none; b=dUbRRSDEk4SrVZ9yz6kwHrK/p0WmQkrK2gH+Fz6K1nHXG4hZF5BOI24Hya+R/A0cIr1NdVw0tMpVI/T41rK0K9YqlhVEknmioFWCJSu9Le/mGLMQ577dwcijmiivgpatSPMuVPIHjas52DpBVQN462yJk2xDIDcXyl2rEmVrbjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753848968; c=relaxed/simple;
	bh=7CTv2eFnrYTyLbXTpSMkgisEsWLxApbFpqIfcyN+qM4=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=LAY8XhR1D9eEx40+HeinCsBZwcznW69yPlmV99vJLHQdsE805pMAXysS8OY+UwWfvlEDRQArnoGXhdB7n6HSWouVyy/AwzG2Bb2FKO/z3RhL5A1A7WNMd6t/7n0MOIxW5FzRCoNFveG6RUcXf9Wqih0Qs10FAzl1NCCXVkTNWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SgUje2in; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250730041603epoutp04db1e59e6c1957455712162a9863bcad7~W7Fb-jV7C0559205592epoutp04a
	for <linux-rtc@vger.kernel.org>; Wed, 30 Jul 2025 04:16:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250730041603epoutp04db1e59e6c1957455712162a9863bcad7~W7Fb-jV7C0559205592epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753848963;
	bh=CB1G052Ym6eC+ql2GG5IxULt6yYskrTaLEPsGeUfdZQ=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=SgUje2inFBOJM4uRXoXdqaQixjOrV3JDJgeAIY6cFPCbUfSshQiFR/dTiuLH1gFc/
	 +sJahnJMOacwcfEAkTf9g3hrYo7XSy4YNz8cWS/GULZJv+9XfYe7Vw5UswchnvFIKO
	 +mfeHiBpKjdr2h5GNuLCNlX4+qPtwZ4YoSfBeWP4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250730041602epcas5p3ac10266bf1f1b19e4c88cffe35a51ba7~W7FbaiNeo0782007820epcas5p38;
	Wed, 30 Jul 2025 04:16:02 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bsJmd5B6hz6B9mL; Wed, 30 Jul
	2025 04:16:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250730041600epcas5p19ee4c430c3f6d28b0ec1b8f962c33e90~W7FZyXgwD1206112061epcas5p1S;
	Wed, 30 Jul 2025 04:16:00 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250730041559epsmtip14c7f776d90e03c6368495aa9d94b3b3b~W7FYYBde90047500475epsmtip1F;
	Wed, 30 Jul 2025 04:15:59 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-2-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Wed, 30 Jul 2025 09:45:58 +0530
Message-ID: <36d301dc0108$a8423670$f8c6a350$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygIGWJ0zAVVuF6axrVxZoA==
X-CMS-MailID: 20250730041600epcas5p19ee4c430c3f6d28b0ec1b8f962c33e90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe@epcas5p4.samsung.com>
	<20250710083434.1821671-2-dev.tailor@samsung.com>



> -----Original Message-----
> From: Devang Tailor <dev.tailor@samsung.com>
> Sent: Thursday, July 10, 2025 2:05 PM
> To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; alexandre.belloni@bootlin.com;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> rtc@vger.kernel.org; faraz.ata@samsung.com
> Cc: Devang Tailor <dev.tailor@samsung.com>
> Subject: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
> exynosautov9
> 
> Add "samsung,exynosautov9-rtc" dedicated compatible for on-chip RTC
> found in ExynosAutov9 SoC.
> 
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



